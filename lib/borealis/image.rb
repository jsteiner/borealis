class Borealis
  class Image
    class InvalidMetadataError < StandardError; end

    attr_reader :width, :height, :colors, :border_colors

    def initialize(file, size)
      data = ImageReader.run(file, size)
      @border_colors = []
      @colors = []
      parse(data)
    end

    def best_border_color
      @border_colors.group_by(&:rgb).values.max_by(&:size).first
    end

    private

    def parse(data)
      image_metadata, *pixels_data = data.split("\n")

      get_height_and_width image_metadata
      get_colors pixels_data
    end

    def get_height_and_width(image_metadata)
      if image_metadata =~ /(\d+),(\d+)/
        @height, @width = $~.captures.map(&:to_i)
      else
        raise InvalidMetadataError
      end
    end

    def get_colors(pixels_data)
      pixels_data.each do |pixel_datum|
        pixel = Pixel.new(pixel_datum, width, height)
        color = Color.new(*pixel.rgb)

        if pixel.border_color?
          @border_colors << color
        end

        @colors << color
      end
    end

    class Pixel
      class InvalidPixelDataError < StandardError; end

      attr_reader :r, :g, :b, :x, :y

      def initialize(data, image_width, image_height)
        @image_width, @image_height = image_width, image_height

        if data =~ /(\d+),(\d+):\s+\(([\s\d]+),([\s\d]+),([\s\d]+)\)/
          @x, @y, @r, @g, @b = $~.captures.map(&:to_i)
        else
          raise InvalidPixelDataError
        end
      end

      def border_color?
        x.zero? || y.zero? || x == (@image_width - 1) || y == (@image_height - 1)
      end

      def rgb
        [r, g, b]
      end
    end
  end
end
