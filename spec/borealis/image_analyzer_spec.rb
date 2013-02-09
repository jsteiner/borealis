require 'spec_helper'

describe Borealis::ImageAnalyzer, '#process' do
  it 'returns data in the correct format' do
    image = 'spec/fixtures/winter.jpg'
    analysis = Borealis::ImageAnalyzer.new(image).process

    expect(analysis).to match(/\(([\s+\d+,]+)\).+([\#][0-9,A-F,a-f]{6})/)
  end

  it 'returns 10 lines' do
    image = 'spec/fixtures/winter.jpg'
    analysis = Borealis::ImageAnalyzer.new(image).process

    expect(analysis.lines.count).to eq 10
  end

  it 'raises Cocaine::ExitStatusError when the image is not present' do
    image = 'spec/fixtures/nonexistent.jpg'

    silence_stderr do
      expect {
        Borealis::ImageAnalyzer.new(image).process
      }.to raise_error(Cocaine::ExitStatusError)
    end
  end
end
