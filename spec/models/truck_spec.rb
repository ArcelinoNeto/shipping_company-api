require 'rails_helper'

RSpec.describe Truck, type: :model do
  it { is_expected.to belong_to :truck_driver }
  it { is_expected.to have_many :deliveries }

  it {is_expected.to validate_presence_of(:name) }
end
