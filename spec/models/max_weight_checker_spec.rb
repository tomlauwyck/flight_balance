require 'rails_helper'

RSpec.describe MaxWeightChecker, type: :model do

  describe "is_within_limits?" do

    let(:within_limit_data) { {
                    "max_takeoff" => "2440",
                    "empty" => "1578.98",
                    "front" => "192.42",
                    "rear" => "11.02",
                    "baggage" => "20",
                    "fuel" => "288",
                    "fuel_allowance" => "-7"
                  } }
    let(:out_of_limit_data) { {
      "max_takeoff" => "1000",
      "empty" => "1578.98",
      "front" => "192.42",
      "rear" => "11.02",
      "baggage" => "20",
      "fuel" => "288",
      "fuel_allowance" => "-7"
    } }

    it 'returns true if the maximum takeoff weight is smaller than the sum of the weights' do
      result = MaxWeightChecker.is_within_limits?(within_limit_data)
      expect(result).to be_truthy
    end

    it 'returns false if the maximum takeoff weight is larger than the sum of the weights' do
      result = MaxWeightChecker.is_within_limits?(out_of_limit_data)
      expect(result).to be_falsey
    end
  end
end