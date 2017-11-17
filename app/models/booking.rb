class Booking < ApplicationRecord


  belongs_to :hotel

  validates :check_in, presence: true
  validates :check_out, presence: true
end
