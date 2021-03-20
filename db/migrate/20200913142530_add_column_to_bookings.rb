class AddColumnToBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :flight_id
    add_reference :bookings, :flight, index: true
  end
end
