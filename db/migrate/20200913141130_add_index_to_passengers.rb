class AddIndexToPassengers < ActiveRecord::Migration[5.2]
  def change
    add_reference :passengers, :booking, index: true
  end
end
