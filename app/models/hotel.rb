class Hotel < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :comments, through: :reviews
  has_many :ratings, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :emails, dependent: :destroy
end
