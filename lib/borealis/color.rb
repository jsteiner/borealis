class Borealis
  class Color
    include Math

    attr_reader :red, :green, :blue

    def initialize(red, green, blue)
      @red = red
      @green = green
      @blue = blue
    end

    def distance_to(other)
      Math.sqrt((red - other.red) ** 2 + (green - other.green) ** 2 + (blue - other.blue) ** 2)
    end

    def rgb
      "(#{red}, #{green}, #{blue})"
    end

    def hex
      "##{hex_segment red}#{hex_segment green}#{hex_segment blue}"
    end

    def ==(other)
      red == other.red && green == other.green && blue == other.blue
    end

    private

    def hex_segment(primary_color)
      primary_color.to_s(16).rjust(2, '0').upcase
    end
  end
end
