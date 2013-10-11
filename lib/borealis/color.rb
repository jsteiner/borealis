class Borealis
  class Color
    include Math

    attr_reader :red, :green, :blue

    def initialize(red, green, blue)
      @red = red
      @green = green
      @blue = blue
    end

    def rgb_distance_to(other)
      Math.sqrt((red - other.red) ** 2 + (green - other.green) ** 2 + (blue - other.blue) ** 2)
    end

    def lab_distance_to(other)
      l, a, b = to_lab
      other_l, other_a, other_b = other.to_lab
      Math.sqrt((l - other_l) ** 2 + (a - other_a) ** 2 + (b - other_b) ** 2)
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

    # http://www.easyrgb.com/index.php?X=MATH&H=07#text7
    def to_lab
      reference_white_X =  95.047
      reference_white_Y = 100.000
      reference_white_Z = 108.883

      x, y, z = to_xyz
      x = x / reference_white_X
      y = y / reference_white_Y
      z = z / reference_white_Z

      x, y, z = [x, y, z].map do |value|
        if value > 0.008856
          value ** (1.0 / 3.0)
        else
          7.787 * value + 16.0 / 116.0
        end
      end

      cie_L = 116 * y - 16
      cie_a = 500 * (x - y)
      cie_b = 200 * (y - z)

      [cie_L, cie_a, cie_b]
    end

    private

    def hex_segment(primary_color)
      primary_color.to_s(16).rjust(2, '0').upcase
    end

    # http://www.easyrgb.com/index.php?X=MATH&H=02#text2
    def to_xyz
      r, g, b = [@red, @green, @blue].map do |value|
        value = value / 255.0
        if value > 0.04045
          value = ((value + 0.055) / 1.055) ** 2.4
        else
          value = value / 12.92
        end
        value * 100.0
      end

      x = r * 0.4124 + g * 0.3576 + b * 0.1805
      y = r * 0.2126 + g * 0.7152 + b * 0.0722
      z = r * 0.0193 + g * 0.1192 + b * 0.9505

      [x, y, z]
    end
  end
end
