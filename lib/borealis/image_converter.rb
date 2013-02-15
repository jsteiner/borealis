class Borealis
  class ImageConverter
    def initialize(image, size)
      @image = image
      @size = size || '50x50'
    end

    def self.to_colors(image, size)
      ImageConverter.new(image, size).to_colors
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
        line = line.scan(/\(([\d+\s+,]+)\)/).flatten
        rgb_values = line.first.split(',').map { |value| value.to_i }

        Color.new(*rgb_values)
      end
    end
  end
end
