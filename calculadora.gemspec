# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'calculadora/version'

Gem::Specification.new do |spec|
  spec.name          = "calculadora"
  spec.version       = Calculadora::VERSION
  spec.authors       = ["marcos.ocf01"]
  spec.email         = ["marcos.ocf01@gmail.com"]
  spec.summary       = %q{Simple calculator interface who provides expression with easy construction}
  spec.homepage      = "https://github.com/MarcosOcf/calculadora-ruby"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
