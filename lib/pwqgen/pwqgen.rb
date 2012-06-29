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
		def initialize
			@@wordlist_size = @@wordlist.length
			@@separators = "-_!$&*+=23456789".split(//)
			@@separators_size = @@separators.length
			@rand = Random.new
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
			output = Array.new
			for i in 1..length
				output << @@wordlist[@rand.rand(@@wordlist_size)]
				output[i-1] = output[i-1].capitalize if @rand.rand(2)

				output << @@separators[@rand.rand(@@separators_size)] unless i == length
			end
			output.join
		end
	end
end
