class Borealis
  class Cluster
    attr_reader :center, :colors

    def initialize(center)
      @center = center
      @colors = []
    end

    def recenter!
      red_sum = green_sum = blue_sum = 0

      colors.each do |color|
        red_sum += color.red
        green_sum += color.green
        blue_sum += color.blue
      end

      old_center = @center
      @center = Color.new(
        red_sum / colors.length,
        green_sum / colors.length,
        blue_sum / colors.length
      )

      @colors.clear

      old_center.rgb_distance_to @center
    end
  end
end
