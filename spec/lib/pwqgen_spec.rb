require 'spec_helper'

describe Pwqgen do
	it "should return a random password" do
		password = Pwqgen.generate
		password.should_not be_nil
		password.should_not be_empty
		password.should be_kind_of(String)
		password.length.should >= (9 + 3 - 1)
		password.length.should <= (27 + 3 - 1)
	end

	it "should return a short random password when given a length of 1" do
		password = Pwqgen.generate 1
		password.should_not be_nil
		password.should_not be_empty
		password.should be_kind_of(String)
		password.length.should >= (3 + 1 - 1)
		password.length.should <= (9 + 1 - 1)
	end

	it "should return a longer random password when given a length of 5" do
		password = Pwqgen.generate 5
		password.should_not be_nil
		password.should_not be_empty
		password.should be_kind_of(String)
		password.length.should >= (15 + 5 - 1)
		password.length.should <= (45 + 5 - 1)
	end

	it "should return a Pwqgen::Generator object when Pwqgen.new is called" do
		obj = Pwqgen.new
		obj.should_not be_nil
		obj.should be_an_instance_of(Pwqgen::Generator)
	end
end

describe Pwqgen::Generator do
	it "should return a random password" do
		password = Pwqgen::Generator.new.generate
		password.should_not be_nil
		password.should_not be_empty
		password.should be_kind_of(String)
		password.length.should >= (9 + 3 - 1)
		password.length.should <= (27 + 3 - 1)
	end

	it "should return a short random password when given a length of 1" do
		password = Pwqgen::Generator.new.generate 1
		password.should_not be_nil
		password.should_not be_empty
		password.should be_kind_of(String)
		password.length.should >= (3 + 1 - 1)
		password.length.should <= (9 + 1 - 1)
	end

	it "should return a longer random password when given a length of 5" do
		password = Pwqgen::Generator.new.generate 5
		password.should_not be_nil
		password.should_not be_empty
		password.should be_kind_of(String)
		password.length.should >= (15 + 5 - 1)
		password.length.should <= (45 + 5 - 1)
	end
end
