# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "frozen_record/associations/version"

Gem::Specification.new do |spec|
  spec.name          = "frozen_record_associations"
  spec.version       = FrozenRecord::Associations::VERSION
  spec.authors       = ['Keith Roehrenbeck']
  spec.email         = ['kroehrenbeck@gmail.com']
  spec.summary       = "Association extension for FrozenRecord"
  spec.homepage      = "https://github.com/goldstar/frozen_record_associations"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5"

  spec.add_runtime_dependency 'frozen_record'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'coveralls'
end
