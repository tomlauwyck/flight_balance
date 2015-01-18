class MaxWeightChecker
  extend DataHelper

  def self.is_within_limits?(weights_hash)
    max_takeoff_weight(weights_hash) > sum_hash_values(weights_hash)
  end
end