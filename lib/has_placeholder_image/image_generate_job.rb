# frozen_string_literal: true

module HasPlaceholderImage
  class ImageGenerateJob < ApplicationJob
    queue_as :default

    def perform(source_class:, id:, options:)
      model  = source_class.constantize
      record = model.find(id)

      source_attr = record.send(options[:source])
      target_attr = record.send(options[:target])

      text  = TextGenerator.send(options[:transformer], source_attr)
      image = ImageGenerator.new(text, **options)

      target_attr.attach(io: File.open(image.file), filename: File.basename(image.file))
    end
  end
end
