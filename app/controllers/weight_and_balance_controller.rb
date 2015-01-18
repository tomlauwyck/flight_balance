class WeightAndBalanceController < ApplicationController

  def new
    render :new
  end

  def calculate

    @weight = params[:weight].dup
    @arm = params[:arm].dup
    @moment = params[:moment].dup

    @data = [@weight, @arm, @moment]
    @within_limits = MaxWeightChecker.is_within_limits?(@weight)
    @totals = WeightAndBalanceCalculation.execute(@weight, @moment)

    render :result
  end
end