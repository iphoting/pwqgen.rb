# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
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
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.8.7'
  s.required_rubygems_version = ">= 1.3.6"
  s.add_runtime_dependency('docopt', "~> 0.5.0")
  s.add_runtime_dependency('sysrandom')

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'aruba'
end
