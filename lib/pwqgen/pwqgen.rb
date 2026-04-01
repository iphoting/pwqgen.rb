require 'securerandom'
require 'pwqgen/wordlist'

# Public: Pwqgen is a Ruby implementation of passwdqc's pwqgen password
# generator.
#
# Examples
#
#   Pwqgen.generate
#   # => "Unrest3Male!trout"
#
#   Pwqgen.new.generate
#   # => "Obese6Perish6viola"
#
# 	Pwqgen::Generator.new.generate
# 	# => "Crime2Behave=growth"
#
# 	Pwqgen::Generator.new.generate 4
# 	# => "Caesar-Madam7draft8choose"
#
module Pwqgen

	# Public: Returns a random generated password string.
	#
	# length - number of words used to create the passphrase.
	#
	# Example
	#
	# 	Pwqgen.generate 2
	# 	# => "Loyal8atomic"
	#
	# 	Pwqgen.generate
	# 	# => "Gate*Abound&hull"
	#
	# Returns a password string.
	def self.generate(length = 3)
		self::Generator.new.generate length
	end

	def self.new
		self::Generator.new
	end

	class Generator
		DEFAULT_SEPARATORS = "-_!$&*+=23456789".chars.freeze

		def initialize(separators = DEFAULT_SEPARATORS)
			@separators = separators
		end

		# Public: Returns a random generated password string.
		#
		# length - number of words used to create the passphrase.
		#
		# Example
		#
		# 	generate 2
		# 	# => "Loyal8atomic"
		#
		# 	generate
		# 	# => "Gate*Abound&hull"
		#
		# Returns a password string.
		def generate(length = 3)
			output = []
			(1..length).each do |i|
				word = WORDLIST[SecureRandom.random_number(WORDLIST.length)]
				word = word.capitalize if SecureRandom.random_number(2).odd?
				output << word
				output << @separators[SecureRandom.random_number(@separators.length)] unless i == length
			end
			output.join
		end
	end
end
