# frozen_string_literal: true

module HasPlaceholderImage
  # Text generation methods
  module TextGenerator
    # This method take text field and parse with delimiter and take first word_count number word
    # first letter upcase
    def self.two_word_first_letter_upcase(value, delimiter: ' ', word_count: 2)
      value.split(delimiter)
           .first(word_count)
           .map(&:first)
           .join
           .upcase
    end
  end
end
