class AddAvailableToTaxis < ActiveRecord::Migration[5.0]
  def change
    add_column :taxis, :available, :boolean
  end
end
