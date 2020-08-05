# frozen_string_literal: true

require 'test_helper'

module HasPlaceholderImage
  class ActiveRecordTest < ActiveSupport::TestCase
    include ActiveJob::TestHelper

    test 'truth' do
      assert_kind_of Module, HasPlaceholderImage::ActiveRecord
    end

    test 'has_placeholder_image is exist?' do
      assert_includes Person.singleton_methods, :has_placeholder_image
    end

    test "If don't have image create placeholder" do
      person = Person.new
      person.name = 'Foo Bar'
      person.save

      ImageGenerateJob.perform_now(source_class: person.class.name,
                                   id: person.id,
                                   options: person.class.placeholder_image_options)
      person.reload
      assert_equal person.photo.attached?, true
    end

    test 'Is it work custom source and target configuration?' do
      company = Company.new
      company.title = 'Buck AI'
      company.save

      ImageGenerateJob.perform_now(source_class: company.class.name,
                                   id: company.id,
                                   options: company.class.placeholder_image_options)
      company.reload
      assert_equal company.logo.attached?, true
    end

    test 'Person model options are default?' do
      assert_equal Person.placeholder_image_options, HasPlaceholderImage.default_options
    end

    test 'Company module options are modified?' do
      default_options = HasPlaceholderImage.default_options
      merged_options = default_options.update(source: :title, target: :logo,
                                              background_color: '#335eea',
                                              font_size: 200)

      assert_equal Company.placeholder_image_options, merged_options
    end
  end
end
