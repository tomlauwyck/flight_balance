class WeightAndBalanceCalculation
  extend DataHelper

  def self.execute(data)
    tot_weight, tot_moment = sum_weights_and_moments(data)
    calculate_arm_total(tot_weight, tot_moment)
  end

  private

  def self.sum_weights_and_moments(data)
    
  end

  def self.calculate_arm_total(tot_weight, tot_moment)
    {}
  end
end