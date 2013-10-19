require 'cocaine'

class Borealis
  class ImageConverter
    def initialize(image, size)
      @image = image
      @size = size || '50x50'
    end

    def read_image
      Cocaine::CommandLine.new(
        'convert',
        "#{@image} -resize #{@size} txt:-"
      ).run
    end

    def to_colors
      colors_for(read_image)
    end

    private

    def colors_for(data)
      lines = data.split("\n").drop(1)
      lines.map do |line|
        rgb_values = line.scan(/\(([\d+\s*,]+)\)/).flatten.first
        if rgb_values
          rgb_values = rgb_values.split(',').map { |value| value.to_i }
          Color.new(*rgb_values.first(3))
        end
      end.compact
    end
  end
end
