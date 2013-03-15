require 'spec_helper'

class Borealis
  describe ImageReader, '.run' do
    it 'returns colors in the correct format' do
      file = 'spec/fixtures/aurora_borealis.jpg'
      image_data = ImageReader.run(file, '10x10')

      expect(image_data).to match(/\(([\s+\d+,]+)\).+([\#][0-9,A-F,a-f]{6}).+(rgb)/)
    end

    it 'raises Cocaine::ExitStatusError when the image is not present' do
      file = 'nonexistent.jpg'

      silence_stderr do
        expect { ImageReader.run(file, 'dimensions') }.to raise_error(Cocaine::ExitStatusError)
      end
    end
  end
end
