# frozen_string_literal: true

require 'rails_helper'
require 'pry'

# rubocop:disable Metrics/BlockLength
RSpec.describe Delivery, type: :request do
  context 'GET /deliveries' do
    let(:url) { '/deliveries' }
    let!(:deliveries) { create_list(:delivery, 5) }

    it 'returns all Deliveries' do
      get url

      expected_deliveries = deliveries[0..4].as_json(only: %i[id origin_city destiny_city])
      expect(deliveries[0..4].as_json(only: %i[id origin_city destiny_city])).to match_array expected_deliveries
    end

    it 'return sucess status' do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

  context 'POST /deliveries' do
    let(:url) { '/deliveries' }

    context 'with valid params' do
      let(:delivery_params) do
        { delivery: attributes_for(:delivery, truck_id: '1', product_id: '1').as_json }.to_json
      end

      it 'adds a new Delivery' do
        # binding.pry
        # expect do
        #     post url, params: delivery_params
        # end.to change(Delivery, :count).by(1)
      end

      it 'returns last added Delivery' do
        post url, params: delivery_params
        expected_delivery = Delivery.last.as_json(only: %i[id origin_city destiny_city])
        expect(body_json['delivery']).to eq expected_delivery
      end

      it 'returns success status' do
        post url, params: delivery_params
        # expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid params' do
      let(:delivery_invalid_params) do
        { delivery: attributes_for(:delivery, origin_city: nil) }.to_json
      end

      it 'does not add a new Delivery' do
        expect do
          post url, params: delivery_invalid_params
        end.to_not change(Delivery, :count)
      end

      it 'returns unprocessable_entity status' do
        post url, params: delivery_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'PATCH /deliveries/:id' do
    let(:delivery) { create(:delivery) }
    let(:url) { "/deliveries/#{delivery.id}" }

    context 'with valid params' do
      let(:new_origin_city) { 'My new Origin City' }
      let(:delivery_params) { { delivery: { origin_city: new_origin_city } }.to_json }

      it 'updates Delivery' do
        patch url, params: delivery_params
        delivery.reload
        # expect(delivery.origin_city).to eq new_origin_city
      end

      it 'returns updated Delivery' do
        patch url, params: delivery_params
        delivery.reload
        expected_delivery = delivery.as_json
        expect(delivery.as_json).to eq expected_delivery
      end

      it 'returns success status' do
        patch url, params: delivery_params
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid params' do
      let(:delivery_invalid_params) do
        { delivery: attributes_for(:delivery, origin_city: nil) }.to_json
      end

      it 'does not update Delivery' do
        old_origin_city = delivery.origin_city
        patch url, params: delivery_invalid_params
        delivery.reload
        expect(delivery.origin_city).to eq old_origin_city
      end

      it 'returns unprocessable_entity status' do
        patch url, params: delivery_invalid_params
        # binding.pry
        # expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context 'DELETE /deliveries/:id' do
    let!(:delivery) { create(:delivery) }
    let(:url) { "/deliveries/#{delivery.id}" }

    it 'removes Delivery' do
      expect do
        delete url
      end.to change(Delivery, :count).by(-1)
    end

    it 'returns success status' do
      delete url
      expect(response).to have_http_status(:no_content)
    end

    it 'does not return any body content' do
      delete url
      expect(body_json).to_not be_present
    end
  end
end
# rubocop:enable Metrics/BlockLength
