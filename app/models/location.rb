class Location < ApplicationRecord

  def self.get_distance_from source_location, destination_location
    longitude_difference = (source_location.longitude - destination_location.longitude).abs
    lattitude_difference = (source_location.lattitude - destination_location.lattitude).abs

    Math.sqrt(longitude_difference ** 2 + lattitude_difference ** 2)
  end
  
end
