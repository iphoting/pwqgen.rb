@announce-cmd
@posix
Feature: Password Generation

	In order to use a secure password for my login
	As an end user
	I want to get a strong randomly generated password

	Scenario: Generate a random password of default length
		When I run `pwqgen.rb`
		Then the output should match /^[A-Za-z]{3,9}([-_!$&*+=23456789][A-Za-z]{3,9}){2}$/

	Scenario: Generate a random password of length 2
		When I run `pwqgen.rb 2`
		Then the output should match /^[A-Za-z]{3,9}([-_!$&*+=23456789][A-Za-z]{3,9}){1}$/

	Scenario: Generate a random password of length 5
		When I run `pwqgen.rb 5`
		Then the output should match /^[A-Za-z]{3,9}([-_!$&*+=23456789][A-Za-z]{3,9}){4}$/


