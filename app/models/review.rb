class Review < ApplicationRecord

  belongs_to :hotel
  has_many :comments, dependent: :destroy

end
