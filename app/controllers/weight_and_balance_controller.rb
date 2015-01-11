class WeightAndBalanceController < ApplicationController

  def new
    render :new
  end

  def calculate
    @weight = { "max_takeoff"=> params[:weight][:max_takeoff],
                "empty"=> params[:weight][:empty],
                "front"=> params[:weight][:front],
                "rear"=> params[:weight][:rear],
                "baggage"=> params[:weight][:baggage],
                "fuel"=> params[:weight][:fuel],
                "fuel_allowance"=> params[:weight][:fuel_allowance]
              }

    @arm = { "empty"=> params[:arm][:empty],
             "front"=> params[:arm][:front],
             "rear"=> params[:arm][:rear],
             "baggage"=> params[:arm][:baggage],
             "fuel"=> params[:arm][:fuel],
             "fuel_allowance"=> params[:arm][:fuel_allowance]
           }

    @moment = { "empty"=> params[:moment][:empty],
                "front"=> params[:moment][:front],
                "rear"=> params[:moment][:rear],
                "baggage"=> params[:moment][:baggage],
                "fuel"=> params[:moment][:fuel],
                "fuel_allowance"=> params[:moment][:fuel_allowance]
              }

    @data = [@weight, @arm, @moment]

    render :result
  end
end