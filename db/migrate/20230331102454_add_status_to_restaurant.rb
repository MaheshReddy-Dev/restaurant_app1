class AddStatusToRestaurant < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :status, :boolean
  end
end
