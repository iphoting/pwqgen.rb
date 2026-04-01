# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift(File.expand_path("lib", __dir__))
require 'pwqgen/version'

Gem::Specification.new do |s|
  s.name        = 'pwqgen.rb'
  s.version     = Pwqgen::VERSION
  s.summary     = "pwqgen in Ruby"
  s.description = "pwqgen.rb is a Ruby implementation of passwdqc's pwqgen, a random pronouncable password generator."
  s.authors     = ["Ronald Ip"]
  s.email       = 'myself@iphoting.com'
  s.homepage    = 'https://github.com/iphoting/pwqgen.rb'

  s.files       = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 3.1'

  s.add_runtime_dependency('docopt', '~> 0.6')

  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'aruba', '~> 2.0'
  s.add_development_dependency 'rdoc', '~> 6.0'
end
