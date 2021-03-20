class ChangeColumnOnAirports < ActiveRecord::Migration[5.2]
  def change
    remove_column :airports, :code
    add_column :airports, :code, :string
  end
end
