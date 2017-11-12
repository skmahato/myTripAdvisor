class Image < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200"}

  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/jpg"]},
                     :size => { :in => 10..500.kilobytes }
  validates :image, presence: true
  validates :user_id, presence: true
  validates :hotel_id, presence: true
end
