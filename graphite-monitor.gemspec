# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graphite/monitor/version'

Gem::Specification.new do |spec|
  spec.name          = "graphite-monitor"
  spec.version       = Graphite::Monitor::VERSION
  spec.authors       = ["Ariel Salomon"]
  spec.email         = ["asalomon@lookout.com"]
  spec.description   = %q{Use Graphite APIs to read monitored values from a Graphite server}
  spec.summary       = %q{Use Graphite APIs to read monitored values}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "json", ">= 1.7.7"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
