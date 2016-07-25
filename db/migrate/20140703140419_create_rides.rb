class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.integer :attraction_id
      t.integer :user_id

      t.timestamps null: false
    end
    add_foreign_key :rides, :users
    add_foreign_key :rides, :attractions
  end
end
