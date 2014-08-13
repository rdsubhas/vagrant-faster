# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "vagrant-faster"
  spec.version       = "0.0.3"
  spec.version       = "#{spec.version}.pre-#{ENV['TRAVIS_BUILD_NUMBER']}" if ENV['TRAVIS']

  spec.authors       = ["rdsubhas"]
  spec.email         = ["rdsubhas@gmail.com"]
  spec.description   = %q{A Vagrant Plugin that makes your VirtualBox VMs faster by allocating more Memory/CPU based on your machine capacity}
  spec.summary       = spec.description
  spec.homepage      = "http://github.com/rdsubhas/vagrant-faster"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
