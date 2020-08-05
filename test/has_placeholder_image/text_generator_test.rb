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

    test 'two_word_first_letter_upcase method working without symbols?' do
      text = 'Foo / Bar'
      result = HasPlaceholderImage::TextGenerator.two_word_first_letter_upcase(text)

      assert_equal 'FB', result
    end

    test 'two_word_first_letter_upcase method working with one word?' do
      text = 'Foo'
      result = HasPlaceholderImage::TextGenerator.two_word_first_letter_upcase(text)

      assert_equal 'F', result
    end
  end
end
