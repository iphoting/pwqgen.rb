#!/usr/bin/env ruby

require 'pwqgen/version'
require 'pwqgen'

doc = "Usage: pwqgen.rb [options] <length>

Options:
  -h, --help  show this help message and exit
  --version   show version and exit

<length>: Number of words in the passphrase. [default: 3]
"

require 'docopt'

if __FILE__ == $0
	options = Docopt(doc, Pwqgen::VERSION)

	if ARGV.length > 0 && ARGV[0].to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) then
		p Pwqgen.generate(ARGV[0].to_i)
	else
		p Pwqgen.generate
	end
end

