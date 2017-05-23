module Taxis
  class Taxi < ApplicationRecord
    belongs_to :current_location, foreign_key: "location_id", class_name: "Location"

    def self.get_nearest user_location, klass=Taxis::Taxi
      @taxis = klass.all
      taxi_distance_mapping = {}
      @taxis.each { |taxi|
        taxi_location = taxi.current_location
        taxi_distance = Location.get_distance_from user_location, taxi_location
        taxi_distance_mapping[taxi_distance] = taxi
      }

      taxi_distance_mapping.min_by { |key| key}.last
    end
  end
end
