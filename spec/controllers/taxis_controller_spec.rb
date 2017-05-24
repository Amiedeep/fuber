require 'rails_helper'

RSpec.describe TaxisController, type: :controller do

  describe "GET #get_nearest" do
    it "return nearest taxi details when present" do
      location = double("Location")
      nearest_taxi = double('Taxi', location_id: 'some_id')

      expect(Location).to receive(:new).and_return(location)
      expect(location).to receive(:save)
      expect(Taxis::Taxi).to receive(:get_nearest).with(location, Taxis::Pink).and_return(nearest_taxi)
      expect(nearest_taxi).to receive(:update_attributes).with({available: false})

      get :get_nearest, params: {location: {lattitude: 5.3, longitude: 6.3}, type: "Taxis::Pink"}

      expect(response).to have_http_status(:success)
    end

    it "return error message when no taxi is available" do
      location = double("Location")

      expect(Location).to receive(:new).and_return(location)
      expect(location).to receive(:save)
      expect(Taxis::Taxi).to receive(:get_nearest).with(location, Taxis::Pink).and_return(nil)

      get :get_nearest, params: {location: {lattitude: 5.3, longitude: 6.3}, type: "Taxis::Pink"}

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({"error"=>"no taxi available"})
    end
  end

end
