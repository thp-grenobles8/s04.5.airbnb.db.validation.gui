class User < ApplicationRecord
  validates :email,
    presence: true,
    uniqueness: true
  validates :phone,
    presence: true,
    format: {
      with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/,
      message: "please enter a valid french number" }

  has_many :bookings, foreign_key: 'guest'

  has_many :owned_rooms, foreign_key: 'owner', class_name: 'Room'

  has_many :booked_rooms, through: :bookings, class_name: 'Room'#, foreign_key: 'room'
end
