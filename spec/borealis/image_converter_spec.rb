require 'spec_helper'

describe Borealis::ImageConverter, '.to_colors' do
  it 'calls to_colors on an instance of ImageConverter' do
    image = 'spec/fixtures/aurora_borealis.jpg'
    image_converter = stub('image converter', :to_colors)
    Borealis::ImageConverter.stubs(new: image_converter)

    Borealis::ImageConverter.to_colors(image, '10x10!')

    expect(image_converter).to have_received(:to_colors)
  end
end

describe Borealis::ImageConverter, '#to_colors' do
  it 'returns as many colors as there are pixels' do
    image = 'spec/fixtures/aurora_borealis.jpg'
    colors = Borealis::ImageConverter.to_colors(image, '10x10!')

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
