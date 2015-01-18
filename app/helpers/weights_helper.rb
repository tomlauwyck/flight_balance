module WeightsHelper

  def max_takeoff_weight(weight)
    weight['max_takeoff'].to_i
  end

  def sum_weights(weights)
    values_to_sum = weights.dup
    values_to_sum.delete('max_takeoff')
    sum = values_to_sum.values.map(&:to_f).inject { |sum,n| sum + n }
    sum
  end
end