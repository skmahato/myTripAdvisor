class Hotel < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :comments, through: :reviews
  has_many :ratings, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :emails, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :bookings, dependent: :destroy


  validates :hotel_name, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :email, presence: true

  private

    def self.search(search)
      if search
        @hotels=Hotel.where('hotel_name LIKE :search OR location LIKE :search OR price LIKE :search', search: "%#{search}%")

      else
        find(:all)
      end
    end


end
