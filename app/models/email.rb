class Email < ApplicationRecord

  belongs_to :hotel
  belongs_to :user

  validates :mail, presence: true

end
