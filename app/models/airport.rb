class Airport < ApplicationRecord
    has_many :departing_flights, foreign_key: "origin_id", class_name: "Flight"
    has_many :arriving_flights, foreign_key: "destination_id", class_name: "Flight"
    self.primary_key = "id"
end
