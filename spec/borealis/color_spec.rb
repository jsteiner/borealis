require 'spec_helper'

describe Borealis::Color, '#distance_to' do
  include Math

  it 'calculates the distance correctly' do
    color = Borealis::Color.new(1, 2, 3)
    other_color = Borealis::Color.new(2, 3, 4)
    distance = Math.sqrt((1 - 2) ** 2 + (2 - 3) ** 2 + (3 - 4) ** 2)

    expect(color.distance_to(other_color)).to eq distance
  end
end

describe Borealis::Color, '#rgb' do
  it 'returns a string with the correct rgb value' do
    color = Borealis::Color.new(1, 2, 3)
    expect(color.rgb).to eq '(1, 2, 3)'
  end
end

describe Borealis::Color, '#hex' do
  it 'returns a string with the correct hex value' do
    color = Borealis::Color.new(222, 2, 15)
    expect(color.hex).to eq '#DE020F'
  end
end

describe Borealis::Color, 'equality' do
  it 'returns true if the colors have the same rgb' do
    color = Borealis::Color.new(1, 2, 3)
    expect(color).to eq Borealis::Color.new(1, 2, 3)
  end

  it 'returns false if the colors have different rgbs' do
    color = Borealis::Color.new(1, 2, 3)
    expect(color).not_to eq Borealis::Color.new(2, 2, 3)
  end
end
