# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_conditional_params/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_conditional_params"
  spec.version       = RailsConditionalParams::VERSION
  spec.authors       = ["Brent Royal-Gordon"]
  spec.email         = ["brent@architechies.com"]
  spec.summary       = %q{Patches ActionController::Parameters to let you easily permit parameters sometimes}
  spec.homepage      = "http://github.com/brentdax/rails_conditional_params"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.required_ruby_version = '>= 2.2.0'
  spec.add_dependency "actionpack", ">= 4.2.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "rack-test", "~> 0.6.3"
end
