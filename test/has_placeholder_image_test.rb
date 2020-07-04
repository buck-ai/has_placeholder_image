# frozen_string_literal: true

require 'test_helper'

module HasPlaceholderImage
  class Test < ActiveSupport::TestCase
    test 'HasPlaceholderImage module is exist?' do
      assert_kind_of Module, HasPlaceholderImage
    end

    test 'Default options method is exist?' do
      assert_includes HasPlaceholderImage.singleton_methods, :default_options
    end

    test 'Setup method is exist?' do
      assert_includes HasPlaceholderImage.singleton_methods, :setup
    end

    test 'Configuration keys are exist?' do
      config_options = %i[background_color font_color font_size
                          transformer source target output_path
                          height width].sort

      assert_equal HasPlaceholderImage.default_options.keys.sort, config_options
    end
  end
end
