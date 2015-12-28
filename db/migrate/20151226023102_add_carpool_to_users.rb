class AddCarpoolToUsers < ActiveRecord::Migration
  def change
    add_column :users, :carpool, :boolean, default: false, null: false
  end
end
