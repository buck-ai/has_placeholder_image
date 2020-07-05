# frozen_string_literal: true

module HasPlaceholderImage
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __dir__)

      desc 'Creates a Has Placeholder Image initializer to your application.'

      def copy_initializer
        template 'has_placeholder_image.rb', 'config/initializers/has_placeholder_image.rb'
      end
    end
  end
end
