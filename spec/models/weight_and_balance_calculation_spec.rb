require 'rails_helper'

RSpec.describe WeightAndBalanceCalculation, type: :model do

  let!(:weight) {{"max_takeoff"=>"2440", "empty"=>"1578.98", "front"=>"192.42", "rear"=>"11.02", "baggage"=>"20", "fuel"=>"288", "fuel_allowance"=>"-7"}}
  let(:moment) {{ "empty"=>"135486.19", "front"=>"15972.81", "rear"=>"1301.46", "baggage"=>"2856", "fuel"=>"27360", "fuel_allowance"=>"-665"}}

  describe 'execute' do

    let(:totals) { WeightAndBalanceCalculation.execute(weight, moment) }

    it 'returns a hash' do
      expect(totals).to be_a(Hash)
    end

    it 'calculates the total weight by summing all weights' do
      expect(totals["weight"]).to eq(2083.42)
    end

    it 'calculates the total moment by summing all moments' do
      expect(totals["moment"]).to eq(182311.46)
    end

    it 'calculates the total arm by dividing the total moment by the total weight' do
      expect(totals["arm"]).to eq(87.50586055620086)
    end
  end
end