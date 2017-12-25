class Review < ApplicationRecord

  belongs_to :hotel
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :rating, presence: true

end
