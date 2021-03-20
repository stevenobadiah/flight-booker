class Passenger < ApplicationRecord
    belongs_to :booking
    #has_and_belongs_to_many :bookings
    #has_many :flights, through: :bookings
end
