class Borealis
  class ImageAnalyzer
    def initialize(image)
      @image = image
    end

    def process
      line = Cocaine::CommandLine.new(histogram_command)
      line.run.strip
    end

    private

    def histogram_command
      quantize = "convert #{@image} +dither -colors 10 gif:-"
      histogramize = "convert gif:- -define histogram:unique-colors=true \
                      -format %c histogram:info:-"

      "#{quantize} | #{histogramize}"
    end
  end
end
