class Borealis
  class ImageReader
    def self.run(file, size)
      size = size || '50x50'

      Cocaine::CommandLine.new(
        'convert',
        "#{file} -resize #{size} txt:-"
      ).run
    end
  end
end
