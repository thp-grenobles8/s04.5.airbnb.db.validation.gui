class Room < ApplicationRecord

  belongs_to :city
  belongs_to :owner, class_name: 'User'

  has_many :bookings, foreign_key: 'booked_room'
  has_many :guests, through: :bookings #, class_name: 'User'

  def is_booked?(start, stop)
    self.bookings.each {
      |b|
      if (start..stop).overlaps?(b.start..b.end)
        return true
      end
    }
    return false
  end
end
