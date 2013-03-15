require 'spec_helper'

class Borealis
  describe Image, '#colors' do
    it 'returns as many colors as there are pixels' do
      file = 'spec/fixtures/aurora_borealis.jpg'
      image = Image.new(file, '10x10!')

      expect(image.colors.length).to eq 100
    end
  end

  describe Image, '#border_colors' do
    it 'returns the correct number of border colors' do
      file = 'spec/fixtures/aurora_borealis.jpg'
      image = Image.new(file, '10x10!')

      expect(image.border_colors.length).to eq 36
    end
  end

  describe Image, '#best_border_color' do
    it 'returns the border color if it is a single color' do
      file = 'spec/fixtures/image_with_black_border.jpg'

      image = Image.new(file, '100%')

      black = Color.new(0, 0, 0)
      expect(image.best_border_color).to eq black
    end

    it 'returns the most prominant border color' do
      file = 'spec/fixtures/image_with_mostly_black_border.jpg'

      image = Image.new(file, '10x10!')

      black = Color.new(0, 0, 0)
      expect(image.best_border_color).to eq black
    end
  end
end
