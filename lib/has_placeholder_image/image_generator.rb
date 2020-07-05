require 'rmagick'

module HasPlaceholderImage
  class ImageGenerator
    attr_reader :options, :canvas, :draw, :file, :text

    def initialize(text, **params)
      @options = params
      @text = text
      return if exist?

      generate_canvas
      generate_draw
      generate_result
    end

    private

    def exist?
      base_folder = ::Rails.root.join(@options[:output_path])
      size_folder = base_folder.join("#{@options[:height]}x#{@options[:width]}")
      font_folder = size_folder.join((@options[:font_size]).to_s)
      file_name = "bg_#{@options[:background_color]}-cl_#{@options[:font_color]}-#{@text}.png"
      @file = font_folder.join(file_name)

      File.exist?(@file)
    end

    def generate_canvas
      @canvas = ::Magick::Image.new(@options[:height], @options[:width])
      @canvas.color_reset!(@options[:background_color])
    end

    def generate_draw
      @draw = ::Magick::Draw.new
      @draw.pointsize = @options[:font_size]
      @draw.fill = @options[:font_color]
      @draw.gravity = ::Magick::CenterGravity
      @draw.annotate(@canvas, 0, 0, 0, 0, @text)
    end

    def generate_result
      FileUtils.mkdir_p(File.dirname(@file))
      @canvas.write(@file)
    end
  end
end
