require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'should return me the distance between lat, lng using pythagoras when difference of lats, lngs is positive' do

    destination_location = Location.create(lattitude: 5.6, longitude: 3.7)
    source_location = Location.create(lattitude: 8.6, longitude: 7.7)

    distance_difference = Location.get_distance_from source_location, destination_location

    expect(distance_difference).to eq(5.0)
  end

  it 'should return me the distance between absolute lat, lng using pythagoras when difference between lats, lngs is negative' do

    source_location = Location.create(lattitude: 5.6, longitude: 3.7)
    destination_location = Location.create(lattitude: 8.6, longitude: 7.7)

    distance_difference = Location.get_distance_from source_location, destination_location

    expect(distance_difference).to eq(5.0)
  end
end
