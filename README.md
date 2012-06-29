# pwqgen.rb

[![Build Status](https://secure.travis-ci.org/iphoting/pwqgen.rb.png)](http://travis-ci.org/iphoting/pwqgen.rb) [![Dependency Status](https://gemnasium.com/iphoting/pwqgen.rb.png)](https://gemnasium.com/iphoting/pwqgen.rb)

pwqgen.rb is a Ruby implementation of passwdqc's pwqgen, a random pronouncable password generator.

## Installation

```
gem install pwqgen.rb
```

## Usage

### CLI
You can generate a random password from the command line.
```
$ pwqgen.rb --help
Usage: pwqgen.rb [options] [<length>]

Options:
  -h, --help      show this help message and exit
  -v, --version   show version and exit

<length>: Number of words in the passphrase. [default: 3]
```

### Ruby App
You can `require` it within your app:
```
require 'rubygems'
require 'pwqgen'

p Pwqgen.generate             # => "Image&Both-action"
p Pwqgen.generate 5           # => "Alaska_Union9Calf=domain&ever"

pgen = Pwqgen.new             # => #<Pwqgen::Generator:0x9f6ec40 ...>
p pgen.generate               # => "String5Rebel+horse"
p pgen.generate 2             # => "Easily2desist"
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create new Pull Request

## Related

- A web-based demonstration is available on [Heroku](https://pwqgen.herokuapp.com/). ([Source](https://github.com/iphoting/pwqgen-web)).
- Original C Implementation, <http://www.openwall.com/passwdqc/>.

## Credits

- Original Design and C implementation from <http://www.openwall.com/passwdqc/> by Solar Designer.

