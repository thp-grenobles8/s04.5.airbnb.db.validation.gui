class Booking < ApplicationRecord
  validate :room_is_booked

  belongs_to :booked_room, class_name: 'Room'
  belongs_to :guest, class_name: 'User'

  def duration
    ((self.end - self.start) / 60 / 60 / 24 ).day
  end

  private

  def room_is_booked
    if self.booked_room.is_booked?(self.start, self.end) == true
      errors.add(:date,"room already booked")
    end
  end
end
