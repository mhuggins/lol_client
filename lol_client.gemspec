# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lol_client/version'

Gem::Specification.new do |spec|
  spec.name          = 'lol_client'
  spec.version       = LolClient::VERSION
  spec.authors       = ['mhuggins']
  spec.email         = ['matt.huggins@gmail.com']
  spec.description   = %q{League of Legends REST API Ruby client}
  spec.summary       = %q{League of Legends API client}
  spec.homepage      = 'http://github.com/mhuggins/lol_client'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'representable'
  spec.add_dependency 'rest-client'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'factory_girl'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
