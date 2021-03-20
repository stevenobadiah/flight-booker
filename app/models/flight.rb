class Flight < ApplicationRecord
    belongs_to :origin, class_name: "Airport"
    belongs_to :destination, class_name: "Airport"
    has_many :bookings
    #has_many :passengers, through: :bookings

    def date_formatted
        departure_date.strftime("%m/%d/%Y")
    end

    def time_formatted
        departure_date.strftime("%H:%M")
    end
end
