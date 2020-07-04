# frozen_string_literal: true

require 'test_helper'

module HasPlaceholderImage
  class ImageGeneratorTest < ActiveSupport::TestCase
    test 'truth' do
      assert_kind_of Module, HasPlaceholderImage::ImageGenerator
    end

    %i[options canvas draw file text].each do |field|
      test "has #{field} fields" do
        assert_includes ImageGenerator.instance_methods, field
      end
    end
  end
end
