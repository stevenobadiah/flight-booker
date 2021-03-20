# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all
Airport.delete_all

Airport.create([{code: 'JFK'}, {code: 'LAX'}, {code: 'ATL'}, {code: 'DEN'}, {code: 'LHR'}, {code: 'HKG'}, {code: 'HEA'}])

665.times do 
    @a1 = Airport.all[rand(7)]
    @a2 = Airport.all[rand(7)]
    @dt = Time.at(((Time.now + 150.days).to_f - (Time.now).to_f)*rand + (Time.now).to_f)
    @td = "#{rand(10)}:#{rand(60)}"
    @fn = rand(1000...9999)
    if @a1 != @a2
        Flight.create(origin_id: @a1.id,
                    destination_id: @a2.id,
                    departure_date: @dt,
                    duration: @td,
                    flight_number: @fn)
    end
end