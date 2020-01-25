require 'rails_helper'
require 'csv'

RSpec.describe InverterRecordsController, type: :controller do
  render_views

  let!(:inverter) { FactoryBot.create(:inverter, ref: '1') }
  let!(:second_inverter) { FactoryBot.create(:inverter, ref: '2') }

  before do
    credentials = ActionController::HttpAuthentication::Basic.encode_credentials ENV['username'], ENV['password']
    request.env['HTTP_AUTHORIZATION'] = credentials
  end

  describe "index" do  
    before do
      (1..10).each do |index|
        FactoryBot.create(:inverter_record, inverter: inverter, produced_at: Date.today + index.hours, energy: index)
      end
    end

    it "successfully set the reports data" do
      get :index

      expect(assigns(:productions_per_hours).values).to eq((1..10).to_a)
      expect(assigns(:production_total)).to eq(55)
      expect(response).to be_success
    end
  end

  describe "import" do
    before do
      @file = fixture_file_upload('files/hourly_production.csv', 'text/csv')
    end

    it "successfully imports the records" do
      post :import, params: { datafile:  @file }

      expect(InverterRecord.count).to eq(48)
    end
  end
end