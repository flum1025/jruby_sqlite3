# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jruby_sqlite3/version'

Gem::Specification.new do |spec|
  spec.name          = "jruby_sqlite3"
  spec.version       = JrubySqlite3::VERSION
  spec.authors       = ["flum1025"]
  spec.email         = ["flum.1025@gmail.com"]

  spec.summary       = %q{Dealing with sqlite3 in the same way in ruby and jruby}
  spec.description   = %q{Dealing with sqlite3 in the same way in ruby and jruby}
  spec.homepage      = "https://github.com/flum1025/jruby_sqlite3"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
