require 'rails_helper'

RSpec.describe Delivery, type: :model do
  it { is_expected.to belong_to :truck }
  it { is_expected.to belong_to :product }
  
  it {is_expected.to validate_presence_of(:origin_city) }
  it {is_expected.to validate_presence_of(:destiny_city) }
end
