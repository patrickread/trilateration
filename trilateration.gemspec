# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'trilateration/version'

Gem::Specification.new do |spec|
  spec.name          = 'trilateration'
  spec.version       = Trilateration::VERSION
  spec.authors       = ["Patrick Read", "Tim Gentry"]

  spec.summary       = %q{Performs a trilateration operation in order to find an unknown point in a Cartesian coordinate system.}
  spec.description   = %q{Trilateration calculates the position of an unknown point, using the distance from three known points to it.}
  spec.homepage      = 'https://github.com/patrickread/trilateration'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.9'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
end
