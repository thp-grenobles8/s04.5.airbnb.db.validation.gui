class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :description
      t.timestamps

      # t.belongs_to :city, index: true
    end
  end
end
