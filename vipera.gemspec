
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vipera/version"

Gem::Specification.new do |spec|
  spec.name          = "vipera"
  spec.version       = Viper::VERSION
  spec.authors       = ["Chan Nyein Thaw"]
  spec.email         = ["chanyeinthaw@outlook.com"]

  spec.summary       = "Viper Module Generator"
  spec.description   = "Viper Module Generator"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
