require 'cocaine'

require 'borealis/cluster'
require 'borealis/color'
require 'borealis/image'
require 'borealis/image_reader'
require 'borealis/kmeans'
require 'borealis/version'

class Borealis
  attr_reader :colors

  def initialize(file, options = {})
    image = Image.new(file, options[:size])
    clusters = KMeans.run(image.colors, parse_options(options))
    @colors = clusters.map(&:center)

    self
  end

  def hexes
    @colors.map(&:hex)
  end

  def rgbs
    @colors.map(&:rgb)
  end

  private

  def parse_options(options)
    {
      number_of_clusters: options[:colors],
      delta: options[:delta],
      static: options[:static]
    }.reject{ |_,v| v.nil? }
  end
end
