require 'spec_helper'

describe Borealis, '#colors' do
  it 'returns the colors from smallest to largest distance' do
    image = 'spec/fixtures/winter.jpg'
    histogram = Borealis.new(image)
    expect(histogram.colors).to eq histogram.colors.sort
  end
end

describe Borealis, '#hexes' do
  it 'returns the correct hexes for the data provided' do
    image = 'spec/fixtures/winter.jpg'
    histogram = Borealis.new(image, FakeAnalyzer)
    expect(histogram.hexes).to eq %w(#2A5E9F #2C2D48)
  end
end

class FakeAnalyzer
  def initialize(file)
  end

  def process
    <<-eos
      51076: ( 1, 2,3) #2A5E9F srgb(1,2,3)
      47529: ( 4, 5, 6) #2C2D48 srgb(4,5,6)
    eos
  end
end
