# Copyright (c) 2012 Vladimir Keleshev <vladimir@keleshev.com>, Alex Speller <alex@alexspeller.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in 
# the Software without restriction, including without limitation the rights to 
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
# of the Software, and to permit persons to whom the Software is furnished to do 
# so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all 
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
# SOFTWARE.

require 'getoptlong'

class Docopt
  attr_reader :docopts
  
  class UnknownOptionError < StandardError; end
  
  class Option
    attr_reader :short, :long, :argcount, :value
    
    def initialize parse
      @argcount                = 0
      options, _, description = parse.strip.partition('  ')
      options                 = options.sub(',', ' ').sub('=', ' ')

      for s in options.split
        if s.start_with? '--'
          @long = s
        elsif s.start_with? '-'
          @short = s
        else
          @argcount = 1
        end
      end
      
      if @argcount == 1
        matched = description.scan(/\[default: (.*)\]/)[0]
        @value = matched ? matched[0] : nil
      end
    end
    
    def set_value val
      if argcount.zero?
        @value = true
      else
        @value = val
      end
    end
    
    def synonyms
      ([short, long] + symbols).compact
    end
    
    def symbols
      [short, long].compact.map do |name|
        name.gsub(/^-+/, '').to_sym
      end
    end

    def getopt
      [long, short, argcount].compact
    end

    def inspect
      "#<Docopt::Option short: #{short}, long: #{long}, argcount: #{argcount}, value: #{value}>"
    end

    def == other
      self.inspect == other.inspect
    end
  end
  
  
  def initialize(doc, version=nil, help=true)
    @docopts = doc.split(/^ *-|\n *-/)[1..-1].map do |line|
      Option.new('-' + line)
    end
    
    GetoptLong.new(*docopts.map(&:getopt)).each do |opt, arg|
      docopt_option = option(opt)
      if help and (opt == '--help' or opt == '-h')
        puts doc.strip
        exit
      elsif version and opt == '--version'
        puts version
        exit
      else
        docopt_option.set_value arg
      end
    end
  end
  
  def option name
    option = @docopts.detect do |docopt|
      docopt.synonyms.include?(name)
    end
    raise UnknownOptionError.new("#{name} option not found") unless option
    option
  end


  
  def value name
    option(name).value
  end
  alias_method :[], :value
    
  def size
    @docopts.size
  end
  
  def inspect
    @docopts.map do |option|
      "#{option.short} #{option.long}=#{option.value.inspect}".strip
    end.join("\n")
  end
end

# Convenience method for Docopt.parse
def Docopt *args
  Docopt.new *args
end