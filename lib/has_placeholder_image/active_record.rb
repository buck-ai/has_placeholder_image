# frozen_string_literal: true

module HasPlaceholderImage
  module ActiveRecord
    extend ActiveSupport::Concern

    class_methods do
      def has_placeholder_image(**options)
        @@placeholder_image_options = HasPlaceholderImage.default_options.merge(options)
        mattr_accessor :placeholder_image_options

        after_validation :generate_placeholder_image, if: :need_placeholder?
      end
    end

    included do
      private

      def generate_placeholder_image
        options = @placeholder_image_options
        text = HasPlaceholderImage::TextGenerator.send(options[:transformer],
                                                       @placeholder_image_source)
        image = HasPlaceholderImage::ImageGenerator.new(text, **options)

        @placeholder_image_target.attach(io: File.open(image.file), filename: File.basename(image.file))
      end

      def need_placeholder?
        @placeholder_image_options = self.class.placeholder_image_options
        @placeholder_image_target = send(@placeholder_image_options[:target])
        @placeholder_image_source = send(@placeholder_image_options[:source])

        !@placeholder_image_target.attached? && !@placeholder_image_source.blank?
      end
    end
  end
end
