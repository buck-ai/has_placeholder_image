# frozen_string_literal: true

class Human < ApplicationRecord
  has_one_attached :photo
  has_placeholder_image

  validates :name, presence: true
end
