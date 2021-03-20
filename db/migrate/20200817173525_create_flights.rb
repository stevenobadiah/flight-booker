class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :from_airport, index: true
      t.references :to_airport, index: true
      t.datetime :takeoff_time
      t.integer :duration

      t.timestamps
    end
  end
end
