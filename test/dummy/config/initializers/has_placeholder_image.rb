# frozen_string_literal: true

HasPlaceholderImage.setup do |config|
  config.background_color = '#000000'
  config.font_color = '#FFFFFF'
  config.font_size = 50
  config.transformer = 'two_word_first_letter_upcase'
  config.source = 'name'
  config.target = 'photo'
  config.output_path = Rails.root.join('tmp/placeholders')
  config.height = 300
  config.width = 300
end
