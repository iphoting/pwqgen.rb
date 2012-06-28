# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'pwqgen/version'

Gem::Specification.new do |s|
  s.name        = 'pwqgen.rb'
  s.version     = Pwqgen::VERSION
  s.summary     = "pwqgen in Ruby"
  s.description = "pwqgen.rb implements passwdqc's pwqgen in Ruby."
  s.authors     = ["Ronald Ip"]
  s.email       = 'myself@iphoting.com'
  s.homepage    = 'https://github.com/iphoting/pwqgen.rb'

  s.files       = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency('docopt', "~>0.0.4")

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
