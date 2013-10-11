require 'spec_helper'

describe Borealis::Color, '#distance_to' do
  it 'calculates the RGB distance correctly' do
    color = Borealis::Color.new(1, 2, 3)
    other_color = Borealis::Color.new(2, 3, 4)
    distance = Math.sqrt((1 - 2) ** 2 + (2 - 3) ** 2 + (3 - 4) ** 2)

    expect(color.rgb_distance_to(other_color)).to eq distance
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

describe Borealis::Color, '#to_lab' do
  it 'converts rgb to lab correctly' do
    color = Borealis::Color.new(255, 204, 0)

    # http://www.easyrgb.com/index.php?X=CALC#Result
    expect(color.to_lab[0]).to be_within(0.01).of(84.197)
    expect(color.to_lab[1]).to be_within(0.01).of(3.680)
    expect(color.to_lab[2]).to be_within(0.01).of(85.223)
  end
end
