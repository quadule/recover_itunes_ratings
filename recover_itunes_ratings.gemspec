# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'recover_itunes_ratings/version'

Gem::Specification.new do |spec|
  spec.name          = "recover_itunes_ratings"
  spec.version       = RecoverItunesRatings::VERSION
  spec.authors       = ["Milo Winningham"]
  spec.email         = ["milo@winningham.net"]

  spec.summary       = %q{Restores iTunes ratings from an iTunes library XML file.}
  spec.homepage      = "https://github.com/quadule/recover_itunes_ratings"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "vendor"]

  spec.add_dependency "rb-scpt", "~> 1.0.1"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
