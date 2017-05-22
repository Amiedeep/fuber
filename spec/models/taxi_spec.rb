require 'rails_helper'

RSpec.describe Taxi, type: :model do
  it 'should have current_location alias for Location model' do
    location = Location.create(lattitude: 4.3, longitude: 5.4)
    taxi = Taxi.create(location_id: location.id)

    expect(taxi.current_location).to eql(location)
  end
end
