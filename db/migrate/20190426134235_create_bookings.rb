class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start
      t.datetime :end
      t.timestamps

      t.references :booked_room, index: true
      t.references :guest, index: true
    end
  end
end
