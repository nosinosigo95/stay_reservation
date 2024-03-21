class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :facility_name
      t.text :introduction
      t.integer :prices
      t.string :address
      t.integer :user_id
      t.timestamps
    end
  end
end
