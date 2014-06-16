# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "bitcoin-money"
  spec.version       = "0.1.0"
  spec.authors       = ["James Larisch"]
  spec.email         = ["root@jameslarisch.com"]
  spec.summary       = "Represent BTC like Money, with nice precision."
  spec.description   = "Represent BTC like Money, with nice precision."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0.0"

end
