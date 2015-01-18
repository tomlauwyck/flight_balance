require 'rails_helper'

RSpec.describe WeightsHelper, type: :helper do
  include WeightsHelper

  let(:weight_data) { {
                              "max_takeoff" => "2440",
                              "empty" => "1578.98",
                              "front" => "192.42",
                              "rear" => "11.02",
                              "baggage" => "20",
                              "fuel" => "288",
                              "fuel_allowance" => "-7"
                            } }
  let(:no_values) { {
                      "max_takeoff" => "",
                      "empty" => "",
                      "front" => "",
                      "rear" => "",
                      "baggage" => "",
                      "fuel" => "",
                      "fuel_allowance" => ""
                    } }
  let(:one_value) { no_values.merge({"empty" => "1000"} )
    }

  let(:three_values) { no_values.merge({"empty" => "1000", "front" => "200", "rear" => "100"}) }

  describe 'sum_weights' do
    it 'returns the sum of 0 elements' do
      expect(sum_weights(no_values)).to eq(0)
    end

    it 'returns the sum of 1 element' do
      expect(sum_weights(one_value)).to eq(1000)
    end

    it 'returns the sum of 3 elements' do
      expect(sum_weights(three_values)).to eq(1300)
    end

    it 'does not use the max takeoff weight for the sum' do
      expect(sum_weights(weight_data)).to eq(2083.42)
    end
  end

  describe 'max_takeoff_weight' do

    it 'returns the max takeoff weight when given a hash of weights' do
      expect(max_takeoff_weight(weight_data)).to eq(2440)
    end

    it 'returns the max takeoff weight as an integer' do
      expect(max_takeoff_weight(weight_data)).to be_a(Integer)
    end
  end
end