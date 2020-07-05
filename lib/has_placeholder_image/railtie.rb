# frozen_string_literal: true

module HasPlaceholderImage
  class Railtie < ::Rails::Railtie
    initializer 'has_placeholder_image.initialize' do |app|
      railtie_collection = app.railties
      activerecord_railtie = railtie_collection.select { |railtie| railtie.class.to_s == 'ActiveRecord::Railtie' }
      return unless activerecord_railtie

      require 'has_placeholder_image/active_record'
      ::ActiveRecord::Base.include(HasPlaceholderImage::ActiveRecord)
    end
  end
end
