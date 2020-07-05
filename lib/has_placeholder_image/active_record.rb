# frozen_string_literal: true

module HasPlaceholderImage
  module ActiveRecord
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def has_placeholder_image(**options)
        default_options = HasPlaceholderImage.default_options
        merged_options = default_options.update(options)

        mattr_accessor :placeholder_image_options
        self.placeholder_image_options = merged_options

        after_validation :generate_placeholder_image, if: :need_placeholder?

        include HasPlaceholderImage::ActiveRecord::InstanceMethods
      end
    end

    module InstanceMethods
      private

      def generate_placeholder_image
        options = self.class.placeholder_image_options
        text = HasPlaceholderImage::TextGenerator.send(options[:transformer],
                                                       @placeholder_image_source)
        image = HasPlaceholderImage::ImageGenerator.new(text, **options)

        @placeholder_image_target.attach(io: File.open(image.file), filename: File.basename(image.file))
      end

      def need_placeholder?
        @placeholder_image_target = send(self.class.placeholder_image_options[:target])
        @placeholder_image_source = send(self.class.placeholder_image_options[:source])

        !@placeholder_image_target.attached? && !@placeholder_image_source.blank?
      end
    end
  end
end
