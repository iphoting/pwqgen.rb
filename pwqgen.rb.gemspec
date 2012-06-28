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
  s.require_paths = ['lib']
  s.files       = `git ls-files`.split("\n")
  s.homepage    = 'https://github.com/iphoting/pwqgen.rb'
  s.has_rdoc    = false
  s.executables << 'pwqgen.rb'

  s.add_runtime_dependency('docopt', "~>0.0.4")
end
