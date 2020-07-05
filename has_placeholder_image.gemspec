$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'has_placeholder_image/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'has_placeholder_image'
  spec.version     = HasPlaceholderImage::VERSION
  spec.authors     = ['Muhammet Dilmaç']
  spec.email       = ['iletisim@muhammetdilmac.com.tr']
  spec.homepage    = 'https://www.github.com/buck-ai/has-placeholder-image'
  spec.summary     = 'Summary of HasPlaceholderImage.'
  spec.description = 'Description of HasPlaceholderImage.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 6.0.0', '>= 6.0.0'
  spec.add_dependency 'rmagick'

  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'sqlite3'
end
