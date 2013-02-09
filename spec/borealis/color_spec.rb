require 'spec_helper'

describe Borealis::Color, '#distance' do
  it 'calculates the distance correctly' do
    color = Borealis::Color.new([1, 2, 3], 'hex')
    expect(color.distance).to eq Math.sqrt(1 ^ 2 + 2 ^ 2 + 3 ^ 2)
  end
end

describe Borealis::Color, 'comparison' do
  it 'compares colors according to distance' do
    large_color = Borealis::Color.new([4, 5, 6], 'arbitrary')
    small_color = Borealis::Color.new([2, 3, 4], 'arbitrary')
    smallest_color = Borealis::Color.new([1, 2, 3], 'arbitrary')

    colors = [smallest_color, large_color, small_color]

    expect(colors.sort).to eq [smallest_color, small_color, large_color]
  end
end
