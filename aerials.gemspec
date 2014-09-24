# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aerials/version'

Gem::Specification.new do |spec|
  spec.name          = "aerials"
  spec.version       = Aerials::VERSION
  spec.authors       = ["Roman Exempliarov"]
  spec.email         = ["urvala@gmail.com"]
  spec.summary       = %q{Sorted json generator. Use it for hash signing.}
  spec.description   = %q{Sorted json generator. Use it for hash signing.}
  spec.homepage      = "https://github.com/appelsin/aerials"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.1"
end
