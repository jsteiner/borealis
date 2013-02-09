class Borealis
  class Color
    attr_reader :rgb, :hex

    def initialize(rgb, hex)
      @rgb = rgb
      @hex = hex
    end

    def distance
      @distance ||= Math.sqrt(rgb[0] ^ 2 + rgb[1] ^ 2 + rgb[2] ^ 2)
    end

    def <=>(other)
      distance <=> other.distance
    end
  end
end
