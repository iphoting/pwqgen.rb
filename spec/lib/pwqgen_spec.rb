require 'spec_helper'

describe Pwqgen do
	it "should return a random password" do
		password = Pwqgen.generate
		expect(password).not_to be_nil
		expect(password).not_to be_empty
		expect(password).to be_kind_of(String)
		expect(password.length).to be >= (9 + 3 - 1) # remember word separators
		expect(password.length).to be <= (27 + 3 - 1)
	end

	it "should return a short random password when given a length of 1" do
		password = Pwqgen.generate 1
		expect(password).not_to be_nil
		expect(password).not_to be_empty
		expect(password).to be_kind_of(String)
		expect(password.length).to be >= (3 + 1 - 1)
		expect(password.length).to be <= (9 + 1 - 1)
	end

	it "should return a longer random password when given a length of 5" do
		password = Pwqgen.generate 5
		expect(password).not_to be_nil
		expect(password).not_to be_empty
		expect(password).to be_kind_of(String)
		expect(password.length).to be >= (15 + 5 - 1)
		expect(password.length).to be <= (45 + 5 - 1)
	end

	it "should return a Pwqgen::Generator object when Pwqgen.new is called" do
		obj = Pwqgen.new
		expect(obj).not_to be_nil
		expect(obj).to be_an_instance_of(Pwqgen::Generator)
	end
end

describe Pwqgen::Generator do
	it "should return a random password" do
		password = Pwqgen::Generator.new.generate
		expect(password).not_to be_nil
		expect(password).not_to be_empty
		expect(password).to be_kind_of(String)
		expect(password.length).to be >= (9 + 3 - 1)
		expect(password.length).to be <= (27 + 3 - 1)
	end

	it "should return a short random password when given a length of 1" do
		password = Pwqgen::Generator.new.generate 1
		expect(password).not_to be_nil
		expect(password).not_to be_empty
		expect(password).to be_kind_of(String)
		expect(password.length).to be >= (3 + 1 - 1)
		expect(password.length).to be <= (9 + 1 - 1)
	end

	it "should return a longer random password when given a length of 5" do
		password = Pwqgen::Generator.new.generate 5
		expect(password).not_to be_nil
		expect(password).not_to be_empty
		expect(password).to be_kind_of(String)
		expect(password.length).to be >= (15 + 5 - 1)
		expect(password.length).to be <= (45 + 5 - 1)
	end
end
