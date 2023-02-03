# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TruckDriversController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/truck_drivers').to route_to('truck_drivers#index')
    end

    it 'routes to #show' do
      expect(get: '/truck_drivers/1').to route_to('truck_drivers#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/truck_drivers').to route_to('truck_drivers#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/truck_drivers/1').to route_to('truck_drivers#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/truck_drivers/1').to route_to('truck_drivers#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/truck_drivers/1').to route_to('truck_drivers#destroy', id: '1')
    end
  end
end
