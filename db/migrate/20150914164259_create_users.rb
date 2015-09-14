class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :last_name
      t.string :first_name
      t.boolean :admin
      t.string :email
      t.boolean :god_mode
      t.string :phone

      t.timestamps null: false
    end
  end
end
