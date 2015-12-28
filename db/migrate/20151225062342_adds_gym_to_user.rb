class AddsGymToUser < ActiveRecord::Migration
  def change
    add_column :users, :gym, :boolean, default: false, null: false
  end
end
