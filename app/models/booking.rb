class Booking < ApplicationRecord


  belongs_to :hotel
  belongs_to :user

  validates :check_in, presence: true
  validates :check_out, presence: true
end
