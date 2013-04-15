# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fs_scm/version'

Gem::Specification.new do |spec|
  spec.name          = "fs_scm"
  spec.version       = FsScm::VERSION
  spec.authors       = ["John Maya"]
  spec.email         = ["jcmaya@hotmail.com"]
  spec.description   = %q{Capistrano Filesystem adapter}
  spec.summary       = %q{Capistrano Filesystem adapter}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", "~> 2.12"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~>10"
  spec.add_development_dependency "rspec", "~> 2.13"
end
