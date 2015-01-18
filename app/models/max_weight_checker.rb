class MaxWeightChecker
  extend WeightsHelper

  def self.is_within_limits?(weights_hash)
    max_takeoff_weight(weights_hash) > sum_weights(weights_hash)
  end
end