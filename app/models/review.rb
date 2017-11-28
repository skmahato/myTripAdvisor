class Review < ApplicationRecord

  belongs_to :hotel
  has_many :comments, dependent: :destroy

  validates :rating, presence: true

end
