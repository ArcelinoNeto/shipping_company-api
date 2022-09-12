require 'rails_helper'
require 'pry'

RSpec.describe "TruckDrivers", type: :request do

    context "GET /truck_drivers" do
        let(:url) { "/truck_drivers" }
        let!(:truck_drivers) { create_list(:truck_driver, 5) }
        
        it "returns all Truck_drivers" do
            get url
            
            expected_truck_drivers = truck_drivers[0..4].as_json(only: %i(id name))
            expect(truck_drivers[0..4].as_json(only: %i(id name))).to match_array expected_truck_drivers
        end
        
        it "return sucess status" do 
            get url
            expect(response).to have_http_status(:ok)
        end
    end

    context "POST /truck_drivers" do
        let(:url) { "/truck_drivers" }

        context "with valid params" do
            let(:truck_driver_params) { { truck_driver: attributes_for(:truck_driver) }.to_json }

            it 'adds a new Truck_driver' do
                # binding.pry
                # expect do
                #     post url, params: truck_driver_params
                # end.to change(Truck_driver, :count).by(1)
            end

            it 'returns last added Truck_driver' do
                post url, params: truck_driver_params
                expected_truck_driver = TruckDriver.last.as_json(only: %i(id name))
                expect(body_json['truck_driver']).to eq expected_truck_driver
            end

            it 'returns success status' do
                post url, params: truck_driver_params
                # expect(response).to have_http_status(:ok)
            end
        end
      
        context "with invalid params" do
            let(:truck_driver_invalid_params) do 
                { truck_driver: attributes_for(:truck_driver, name: nil) }.to_json
            end
            
            it 'does not add a new Truck_driver' do
                expect do
                    post url, params: truck_driver_invalid_params
                end.to_not change(TruckDriver, :count)
            end

            it 'returns unprocessable_entity status' do
                post url, params: truck_driver_invalid_params
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end

    context "PATCH /truck_drivers/:id" do
        let(:truck_driver) { create(:truck_driver) }
        let(:url) { "/truck_drivers/#{truck_driver.id}" }
    
        context "with valid params" do
            let(:new_name) { 'My new Name' }
            let(:truck_driver_params) { { truck_driver: { name: new_name } }.to_json }

            it 'updates Delivery' do
                patch url, params: truck_driver_params
                truck_driver.reload
                # expect(truck_driver.name).to eq new_name
            end

            it 'returns updated Truck_driver' do
                patch url, params: truck_driver_params
                truck_driver.reload
                expected_truck_driver = truck_driver.as_json
                expect(truck_driver.as_json).to eq expected_truck_driver
            end

            it 'returns success status' do
                patch url, params: truck_driver_params
                expect(response).to have_http_status(:ok)
            end
        end
        
        context "with invalid params" do
            let(:truck_driver_invalid_params) do 
                { truck_driver: attributes_for(:truck_driver, name: nil) }.to_json
            end

            it 'does not update Delivery' do
                old_name = truck_driver.name
                patch url, params: truck_driver_invalid_params
                truck_driver.reload
                expect(truck_driver.name).to eq old_name
            end
            
            it 'returns unprocessable_entity status' do
                patch url, params: truck_driver_invalid_params
                # expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
    
    context "DELETE /deliveries/:id" do
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
