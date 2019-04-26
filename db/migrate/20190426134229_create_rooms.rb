class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :beds
      t.float :price_per_night
      t.text :description
      t.boolean :wifi
      t.text :welcome_message
      t.timestamps

      t.belongs_to :city, index: true
      t.references :owner, index: true
    end
  end
end
