class Person < ApplicationRecord
  has_one_attached :photo
  has_placeholder_image

  validates :name, presence: true
end
