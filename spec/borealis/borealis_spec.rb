require 'spec_helper'

describe Borealis, '#colors' do
  it 'returns the number of colors requested' do
    image = 'spec/fixtures/aurora_borealis.jpg'
    borealis = Borealis.new(image, colors: 6)

    expect(borealis.colors.length).to eq 6
  end
end
