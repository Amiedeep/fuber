class Taxi < ApplicationRecord
  belongs_to :current_location, foreign_key: "location_id", class_name: "Location"
end
