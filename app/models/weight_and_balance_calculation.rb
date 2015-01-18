class WeightAndBalanceCalculation
  extend DataHelper

  def self.execute(weights, moments)
    tot_weight, tot_moment = sum_weights_and_moments(weights, moments)
    tot_arm = arm_total(tot_weight, tot_moment)
    return { "weight"=>tot_weight, "arm"=>tot_arm, "moment"=>tot_moment }
  end

  private

  def self.sum_weights_and_moments(weights, moments)
    weight_sum = sum_hash_values(weights)
    moment_sum = sum_hash_values(moments)
    return weight_sum, moment_sum
  end

  def self.arm_total(tot_weight, tot_moment)
    tot_moment / tot_weight
  end
end