module Taxis
  class Taxi < ApplicationRecord
    belongs_to :current_location, foreign_key: "location_id", class_name: "Location"

    def self.get_nearest user_location, klass=Taxis::Taxi
      @taxis = klass.where(available: true)
      taxi_distance_mapping = {}
      @taxis.each { |taxi|
        taxi_location = taxi.current_location
        taxi_distance = Location.get_distance_from user_location, taxi_location
        taxi_distance_mapping[taxi_distance] = taxi
      }

      nearest_taxi_distance = taxi_distance_mapping.min_by { |key| key}

      return nearest_taxi_distance.last if nearest_taxi_distance
    end
  end
end
