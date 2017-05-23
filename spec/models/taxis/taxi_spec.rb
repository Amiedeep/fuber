require 'rails_helper'

RSpec.describe Taxis::Taxi, type: :model do
  it 'should have current_location alias for Location model' do
    location = Location.create(lattitude: 4.3, longitude: 5.4)
    taxi = Taxis::Taxi.create(location_id: location.id)

    expect(taxi.current_location).to eql(location)
  end

  describe '.get_nearest' do
    it 'should get the nearest taxis from location provided' do
      user_location = Location.create(lattitude: 3.3, longitude: 4.4)
      location1 = Location.create(lattitude: 4.3, longitude: 5.4)
      location2 = Location.create(lattitude: 5.3, longitude: 6.4)
      location3 = Location.create(lattitude: 6.3, longitude: 7.4)
      Taxis::Taxi.create(location_id: location1.id)
      Taxis::Taxi.create(location_id: location2.id)
      Taxis::Taxi.create(location_id: location3.id)

      expect(Location).to receive(:get_distance_from).with(user_location, location1).and_return(2.89)
      expect(Location).to receive(:get_distance_from).with(user_location, location2).and_return(3.89)
      expect(Location).to receive(:get_distance_from).with(user_location, location3).and_return(1.89)

      nearest_taxi = Taxis::Taxi.get_nearest user_location

      expect(nearest_taxi.current_location).to eql(location3)
    end

    it 'should return special type of taxis if parameter is passed' do
      user_location = Location.create(lattitude: 3.3, longitude: 4.4)
      location1 = Location.create(lattitude: 4.3, longitude: 5.4)
      location2 = Location.create(lattitude: 5.3, longitude: 6.4)
      Taxis::Pink.create(location_id: location1.id)
      Taxis::Taxi.create(location_id: location2.id)

      expect(Location).to receive(:get_distance_from).with(user_location, location1).and_return(2.89)
      expect(Location).to_not receive(:get_distance_from).with(user_location, location2)

      nearest_taxi = Taxis::Taxi.get_nearest user_location, Taxis::Pink

      expect(nearest_taxi.current_location).to eql(location1)
    end
  end
end
