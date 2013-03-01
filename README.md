# Borealis

Borealis finds the most prominent colors in an image, attempting to find colors that are distinct from one another.

It provides defaults which favor speed, but the defaults are easily changed if you prefer accuracy. For most purposes, the default settings should be accurate enough.

## Installation

Add this line to your application's Gemfile:

    gem 'borealis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install borealis

## Usage

Find the three prominent colors in an image:

```ruby
Borealis.new('image/path.jpg').colors # Returns 3 colors with hex and rgb attributes
Borealis.new('image/path.jpg').hexes # Returns 3 hex values
Borealis.new('image/path.jpg').rgbs # Returns 3 rgb values
```

Easily get color values out of a color:

```ruby
color = Borealis.new(file).colors.first
color.rgb # "(222, 2, 15)"
color.hex # "#DE020F"
```

Change the defaults:

```ruby
borealis = Borealis.new('image/path.jpg',
  size: '150x150',
  colors: 3,
  delta: 0.001,
  static: false
)
```

### Size

_Default: '50x50'_

Size takes any [Image Geometry](http://www.imagemagick.org/script/command-line-processing.php#geometry) that imagemagick handles.

For more accurate results, use a larger image. However, this comes at a severe time cost.

### Colors

_Default: 3_

The number of colors you want returned.

### Iterations

_Default: 3_

### Static

_Default: true_

Static determines whether the color output will be the same each time given the same image. Use false if you want the colors to change each run.

## How does it work?

Borealis uses the [k-means](http://en.wikipedia.org/wiki/K-means_clustering) clustering algorithm, which in this case:

1. Takes _n_ colors from the image as cluster centers
2. Adds the rest of the colors to the cluster which they are closest to
3. Finds the average color in each cluster, setting the results as new cluster centers
4. Empties each cluster, except for the new center, and repeats steps 2-3 until convergance has been reached

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Borealis is copyright 2013 Josh Steiner and thoughtbot, inc., and may be redistributed under the terms specified in the LICENSE file.
