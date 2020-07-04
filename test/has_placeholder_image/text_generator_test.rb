# frozen_string_literal: true

require 'test_helper'

module HasPlaceholderImage
  class TextGeneratorTest < ActiveSupport::TestCase
    test 'truth' do
      assert_kind_of Module, HasPlaceholderImage::TextGenerator
    end

    test 'two_word_first_letter_upcase method is exist?' do
      assert_includes HasPlaceholderImage::TextGenerator.singleton_methods, :two_word_first_letter_upcase
    end

    test 'two_word_first_letter_upcase method working correct?' do
      text = 'Foo Bar'
      result = HasPlaceholderImage::TextGenerator.two_word_first_letter_upcase(text)

      assert_equal 'FB', result
    end

    test 'two_word_first_letter_upcase method delimiter parameter working correct?' do
      text = 'Foo|Bar'
      result = HasPlaceholderImage::TextGenerator.two_word_first_letter_upcase(text, delimiter: '|')

      assert_equal 'FB', result
    end

    test 'two_word_first_letter_upcase method word_count parameter working correct?' do
      text = 'Foo Bar Baz'
      result = HasPlaceholderImage::TextGenerator.two_word_first_letter_upcase(text, word_count: 1)

      assert_equal 'F', result
    end

    test 'two_word_first_letter_upcase method all parameter working correct?' do
      text = 'Foo|Bar|Baz'
      result = HasPlaceholderImage::TextGenerator.two_word_first_letter_upcase(text, delimiter: '|', word_count: 3)

      assert_equal 'FBB', result
    end
  end
end
