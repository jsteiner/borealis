class Borealis
  class KMeans
    def initialize(colors, options = {})
      @colors = colors
      @number_of_clusters = options[:number_of_clusters] || 3
      @delta = options[:delta] || 0.01
      @static = options.has_key?(:static) ? options[:static] : true

      if @number_of_clusters > @colors.length
        raise 'You may not have more clusters than colors.'
      end
    end

    def run
      if @colors.length == @number_of_clusters
        @colors.map { |color| Cluster.new(color) }
      else
        max_delta = 0
        while max_delta <= @delta do
          @colors.each { |color| add_to_closest_cluster(color) }
          max_delta = clusters.map { |cluster| cluster.recenter! }.max
        end

        clusters
      end
    end

    private

    def clusters
      @clusters ||= @number_of_clusters.times.map do |index|
        if @static
          # Find spaced out colors that are always the same
          color_index = @colors.length * index / @number_of_clusters
          color = @colors[color_index]
        else
          color = @colors.sample
          @colors.delete color
        end

        Cluster.new(color)
      end
    end

    def add_to_closest_cluster(color)
      closest_cluster = clusters.min do |a, b|
        color.distance_to(a.center) <=> color.distance_to(b.center)
      end

      closest_cluster.colors << color
    end
  end
end
