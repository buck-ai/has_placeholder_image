# frozen_string_literal: true

require 'active_record/railtie'

module HasPlaceholderImage
  class Railtie < ::Rails::Railtie
    initializer 'has_placeholder_image.initialize' do |app|
      railtie_collection = app.railties
      activerecord_railtie = railtie_collection.select { |railtie| railtie.class.to_s == 'ActiveRecord::Railtie' }
      ::ActiveRecord::Base.include(HasPlaceholderImage::ActiveRecord) if activerecord_railtie
    end
  end
end
