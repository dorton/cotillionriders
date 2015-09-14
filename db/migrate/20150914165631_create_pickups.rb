class CreatePickups < ActiveRecord::Migration
  def change
    create_table :pickups do |t|
      t.integer :student_id
      t.integer :user_id
      t.boolean :current_pickup
      
      t.timestamps null: false
    end
  end
end
