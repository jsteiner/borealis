require 'spec_helper'

describe Borealis::ImageConverter, '#to_colors' do
  it 'returns as many colors as there are pixels' do
    image = 'spec/fixtures/aurora_borealis.jpg'
    colors = Borealis::ImageConverter.new(image, '10x10!').to_colors

    expect(colors.length).to eq 100
  end
end

describe Borealis::ImageConverter, '#read_image' do
  it 'returns colors in the correct format' do
    image = 'spec/fixtures/aurora_borealis.jpg'
    image_data = Borealis::ImageConverter.new(image, '10x10').read_image

    expect(image_data).to match(/\(([\s+\d+,]+)\).+([\#][0-9,A-F,a-f]{6}).+(rgb)/)
  end

  it 'raises Cocaine::ExitStatusError when the image is not present' do
    image = 'nonexistent.jpg'
    image_converter = Borealis::ImageConverter.new(image, 'dimensions')

    silence_stderr do
      expect { image_converter.read_image }.to raise_error(Cocaine::ExitStatusError)
    end
  end
end
