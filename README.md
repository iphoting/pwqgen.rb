# pwqgen.rb

[![Build Status](https://secure.travis-ci.org/iphoting/pwqgen.rb.png)](http://travis-ci.org/iphoting/pwqgen.rb) [![Dependency Status](https://gemnasium.com/iphoting/pwqgen.rb.png)](https://gemnasium.com/iphoting/pwqgen.rb)

pwqgen.rb is a Ruby implementation of passwdqc's pwqgen password generator.

## Installation

```
gem install pwqgen.rb
```

## Usage

### CLI
```
$ pwqgen.rb
```

### Ruby App

- First, add `pwqgen.rb` into your `Gemfile`.

- Within your application, `require "pwqgen"`.

- Then, invoke `Pwqgen.generate` for a random password.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

