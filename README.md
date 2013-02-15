# Borealis

Borealis finds the most prominent colors in an image by using a clustering algorithm (k-means), which returns colors that are distinct from one another. It provides defaults which favor speed, but the defaults are easily changed if you prefer accuracy. For most purposes, the default settings should be accurate enough.

## Installation

Add this line to your application's Gemfile:

    gem 'borealis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install borealis

## Usage

Find the three prominent colors in an image:

    Borealis.new('image/path.jpg').colors # Returns 3 colors with hex and rgb attributes
    Borealis.new('image/path.jpg').hexes # Returns 3 hex values
    Borealis.new('image/path.jpg').rgbs # Returns 3 rgb values

Easily get color values out of a color:

    color = Borealis.new(file).colors.first
    color.rgb # "(222, 2, 15)"
    color.hex # "#DE020F"

Change the defaults:

    borealis = Borealis.new('image/path.jpg',
      size: '150x150',
      colors: 3,
      iterations: 10,
      static: false
    )

### Size

Defaults to '50x50'.

Size takes any arguments that imagemagick handles. See [here](http://www.imagemagick.org/script/command-line-processing.php#geometry) for reference.

For more accurate results, use a larger image. However, this comes at a severe time cost.

### Colors

Defaults to 3.

The number of colors you want returned.

### Iterations

Defaults to 3.

### Static

Defaults to true.

Static determines whether the color output will be the same each time given the same image. Use false if you want the "best" colors to change each run.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
