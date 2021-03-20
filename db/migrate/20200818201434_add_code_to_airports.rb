class AddCodeToAirports < ActiveRecord::Migration[5.2]
  def change
    add_column :airports, :code, :integer
    add_index :airports, :code
    add_column :airports, :city, :string
    remove_column :airports, :name
  end
end
