#!/usr/bin/env ruby

require 'pwqgen/version'
require 'pwqgen'
require 'docopt'

filename = File.basename(__FILE__)

doc = <<DOCOPT
Generate a random pronouncable passphrase.

Usage:
  #{filename} [LENGTH]
  #{filename} [-h | --help]
  #{filename} [-v | --version]

Arguments:
  LENGTH          Number of words in the passphrase. [default: 3]

Options:
  -h, --help      show this help message and exit
  -v, --version   show version and exit

DOCOPT

begin
  options = Docopt::docopt(doc, :version => Pwqgen::VERSION)

  if ARGV.length > 0 && ARGV[0].to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) then
    puts Pwqgen.generate(ARGV[0].to_i)
  else
    puts Pwqgen.generate
  end
rescue Docopt::Exit => e
  puts e.message
end

