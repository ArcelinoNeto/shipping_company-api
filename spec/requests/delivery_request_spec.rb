require 'rails_helper'

RSpec.describe Delivery, type: :request do
    
    context "GET /deliveries" do
        let(:url) { "/deliveries" }
        let!(:deliveries) { create_list(:delivery, 5) }
        
        it "returns all deliveries" do
            get url
            expect(body_json["deliveries"]).to contain_exactly deliveries.as_json
        end
        
        it "return sucess status" do 
            get url
            expect(response).to have_http_status(:ok)
        end
    end

end
