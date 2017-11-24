class Room < ApplicationRecord

  belongs_to :hotel

  validates :room_no, presence: true
  validates :guest, presence: true

end
