# frozen_string_literal: true

require 'test_helper'

module HasPlaceholderImage
  class ActiveRecordTest < ActiveSupport::TestCase
    test 'truth' do
      assert_kind_of Module, HasPlaceholderImage::ActiveRecord
    end

    test 'has_placeholder_image is exist?' do
      assert_includes Human.singleton_methods, :has_placeholder_image
    end

    test 'has_placeholder_image_options is exist?' do
      assert_includes Human.instance_methods, :placeholder_image_options
    end

    test 'has_placeholder_image_options has default values?' do
      human = Human.new
      human.name = 'Foo Bar'
      assert_equal human.placeholder_image_options, HasPlaceholderImage.default_options
    end

    test "If don't have image create placeholder" do
      human = Human.new
      human.name = 'Foo Bar'
      human.save

      assert_equal human.photo.attached?, true
    end
  end
end
