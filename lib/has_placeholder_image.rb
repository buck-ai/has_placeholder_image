# frozen_string_literal: true

# HasPlaceholderImage Plugin
module HasPlaceholderImage
  autoload :ActiveRecord,     'has_placeholder_image/active_record'
  autoload :TextGenerator,    'has_placeholder_image/text_generator'
  autoload :ImageGenerator,   'has_placeholder_image/image_generator'
  autoload :ImageGenerateJob, 'has_placeholder_image/image_generate_job'

  mattr_accessor :background_color
  @background_color = '#000000'

  mattr_accessor :font_color
  @font_color = :'#FFFFFF'

  mattr_accessor :font_size
  @font_size = 50

  mattr_accessor :transformer
  @transformer = 'two_word_first_letter_upcase'

  mattr_accessor :source
  @source = :name

  mattr_accessor :target
  @target = :photo

  mattr_accessor :output_path
  @output_path = 'tmp/placeholders'

  mattr_accessor :height
  @height = 300

  mattr_accessor :width
  @width = 300

  def self.default_options
    variables = {}

    class_variables.each do |variable|
      variable_name = variable.to_s.delete('@').to_sym
      variables[variable_name] = class_variable_get(variable)
    end

    variables
  end

  def self.setup
    yield self
  end
end

require 'has_placeholder_image/railtie'
