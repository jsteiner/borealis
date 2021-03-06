# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'borealis/version'

Gem::Specification.new do |gem|
  gem.name          = "borealis"
  gem.version       = Borealis::VERSION
  gem.authors       = ["Josh Steiner"]
  gem.email         = ["josh@jsteiner.me"]
  gem.description   = %q{Finds most prominent colors in a given image.}
  gem.summary       = %q{Finds most prominent colors in a given image.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep("spec")
  gem.require_paths = ["lib"]

  gem.requirements << 'ImageMagick'

  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'bourne'

  gem.add_dependency 'cocaine'
end
