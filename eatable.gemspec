# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eatable/version'

Gem::Specification.new do |spec|
  spec.name          = "eatable"
  spec.version       = Eatable::VERSION
  spec.authors       = ["Lindsey Wells"]
  spec.email         = ["lkwlala@gmail.com"]

  spec.summary       = %q{CLI restaurant scanner which detects occurrences of allergens listed on menus.}
  spec.homepage      = "https://github.com/LKWLaLa/eatable"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  #if spec.respond_to?(:metadata)
#    spec.metadata['allowed_push_host'] = "http://mygemserver.com"
#  else
#    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
#  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  #spec.bindir        = "exe"
  spec.bindir        = "bin"
  #spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = ["eatable"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
