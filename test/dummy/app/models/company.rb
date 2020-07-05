# frozen_string_literal: true

class Company < ApplicationRecord
  has_one_attached :logo
  has_placeholder_image source: :title, target: :logo,
                        background_color: '#335eea',
			font_size: 200

  validates :title, presence: true
end
