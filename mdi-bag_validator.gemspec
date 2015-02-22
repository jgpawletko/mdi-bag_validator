# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mdi/bag_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "mdi-bag_validator"
  spec.version       = Mdi::BagValidator::VERSION
  spec.authors       = ["jgpawletko"]
  spec.email         = ["jgpawletko@gmail.com"]
  spec.summary       = %q{RabbitMQ Bag validation worker}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/jgpawletko/mdi-bag_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "sneakers", "~> 1.0"
  spec.add_dependency "sneakers", "~> 1.0"
  spec.add_dependency "foreman"
end
