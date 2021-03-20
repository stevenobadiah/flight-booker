class ChangeFlights < ActiveRecord::Migration[5.2]
  def change
    rename_column :flights, :takeoff_time, :departure_date
    remove_reference :flights, :from_airport, index: true
    remove_reference :flights, :to_airport, index: true
    add_reference :flights, :origin, index: true
    add_reference :flights, :destination, index: true
    add_column :flights, :flight_number, :integer
  end
end
