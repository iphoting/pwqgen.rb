#!/usr/bin/env ruby

require 'pwqgen/version'
require 'pwqgen'

doc = "Usage: pwqgen.rb [options] [<length>]

Options:
  -h, --help      show this help message and exit
  -v, --version   show version and exit

<length>: Number of words in the passphrase. [default: 3]
"

require 'pwqgen/docopt'

options = Docopt(doc, Pwqgen::VERSION)

if ARGV.length > 0 && ARGV[0].to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) then
puts Pwqgen.generate(ARGV[0].to_i)
else
puts Pwqgen.generate
end

