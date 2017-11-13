class Hotel < ApplicationRecord

  has_many :reviews, dependent: :destroy
  has_many :comments, through: :reviews
  has_many :ratings, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :emails, dependent: :destroy


  private

    def self.search(search)
      if search
        Hotel.where('hotel_name LIKE :search OR location LIKE :search OR price LIKE :search', search: "%#{search}%")
      else
        find(:all)
      end
    end


end
