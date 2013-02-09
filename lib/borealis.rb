require "cocaine"
require "borealis/color"
require "borealis/image_analyzer"
require "borealis/version"

class Borealis
  attr_reader :colors

  def initialize(file, analyzer = ImageAnalyzer)
    analysis = analyzer.new(file).process
    @colors = analysis.split("\n").map { |line| line_to_color(line) }
    colors.sort!
  end

  def hexes
    colors.map(&:hex)
  end

  private

  def line_to_color(line)
    line = line.scan(/\(([\s+\d+,]+)\).+([\#][0-9,A-F,a-f]{6})/).flatten
    rgb = line.first.split(',').map { |value| value.to_i }
    hex = line.last
    Color.new(rgb, hex)
  end
end
