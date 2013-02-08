# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'borealis/version'

Gem::Specification.new do |gem|
  gem.name          = "borealis"
  gem.version       = Borealis::VERSION
  gem.authors       = ["Josh Steiner"]
  gem.email         = ["josh@jsteiner.me"]
  gem.description   = %q{Finds top colors from a given image.}
  gem.summary       = %q{Finds top colors from a given image.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep("spec")
  gem.require_paths = ["lib"]
end
