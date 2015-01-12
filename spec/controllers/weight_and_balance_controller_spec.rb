require 'rails_helper'

RSpec.describe WeightAndBalanceController, type: :controller do

  describe "GET #new" do
    it 'responds successfully with a 200 status code' do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #calculate' do
    let(:weight) {{"weight"=>{"max_takeoff"=>"2440", "empty"=>"1578.98", "front"=>"192.42", "rear"=>"11.02", "baggage"=>"20", "fuel"=>"288", "fuel_allowance"=>"-7"}}}
    let(:arm) {{"arm"=>{"empty"=>"85.81", "front"=>"80.5", "rear"=>"118.1", "baggage"=>"142.8", "fuel"=>"95", "fuel_allowance"=>"95"}}}
    let(:moment) {{"moment"=>{"empty"=>"135486.19", "front"=>"15972.81", "rear"=>"1301.46", "baggage"=>"2856", "fuel"=>"27360", "fuel_allowance"=>"-665"}}}
    let(:params) { weight.merge!(arm).merge!(moment) }

    before { post :calculate, params }

    it 'renders the results page' do
      expect(response).to render_template :result
    end

    it 'responds with a 200 status code' do
      expect(response).to have_http_status(200)
    end

    it 'assigns the hash for the weight column' do
      expect(assigns(:weight)).to eq(params['weight'])
    end

    it 'assigns the hash for the arm column' do
      expect(assigns(:arm)).to eq(params['arm'])
    end

    it 'assigns the hash for the moment column' do
      expect(assigns(:moment)).to eq(params['moment'])
    end

    it 'assigns an array of weight, arm and moment' do
      expect(assigns(:data)).to eq([params['weight'], params['arm'], params['moment']])
    end

    xit 'assigns values for the totals row' do
      expect(assigns(:totals)).to eq("")
    end
  end
end