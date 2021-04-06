# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'has_placeholder_image/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'has_placeholder_image'
  spec.version     = HasPlaceholderImage::VERSION
  spec.authors     = ['Muhammet Dilmaç', 'Utku Kaynar']
  spec.email       = %w[iletisim@muhammetdilmac.com.tr utku@buck.ai]
  spec.homepage    = 'https://www.github.com/buck-ai/has-placeholder-image'
  spec.summary     = 'A Ruby gem for generating string based placeholder images in Rails.'
  spec.description = 'Has Placeholder Image is a Ruby on Rails gem that allows developers to generate placeholder ' \
                     'images for models depending on the title or name attributes of model.'
  spec.license     = 'MIT'

  spec.files = Dir['lib/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 5.0.0'
  spec.add_dependency 'rmagick'

  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov', '0.17'
  spec.add_development_dependency 'sqlite3'
end
