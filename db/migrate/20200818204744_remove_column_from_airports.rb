class RemoveColumnFromAirports < ActiveRecord::Migration[5.2]
  def change
    remove_column :airports, :city
  end
end
