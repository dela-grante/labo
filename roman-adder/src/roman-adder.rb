#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'optparse'

def usage
  warn "Usage: ruby roman-adder.rb [options] operand1 operand2"
  warn "  option"
  warn "      --help             : Show this message."
end

def main
  begin
    OptionParser.new { |opt|
      opt.on('--help') do
        usage
        exit 0
      end

      opt.parse!(ARGV)
    }
  rescue OptionParser::AmbiguousOption => e
    warn("#{e.message}")
    exit 1
  rescue OptionParser::MissingArgument => e
    warn("#{e.message}")
    exit 1
  rescue OptionParser::InvalidOption => e
    warn("#{e.message}")
    exit 1
  end

  # unless ARGV.size == 1
  #   warn("No infile specified.")
  #   exit 1
  # end

  # infile = ARGV[0]

  # unless FileTest::exist?(infile)
  #   warn("#{infile} not found.")
  #   exit 1
  # end

  # unless FileTest::file?(infile)
  #   warn("#{infile} is not a file.")
  #   exit 1
  # end

  # video_channel_from_file(ARGV[0])
  0
end

def int_to_roman(num)
  raise ArgumentError if num < 1 || num > 3999
  r1000 = ["", "M", "MM", "MMM"]
  r100 = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  r10 = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  r1 = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

  roman = ""
  mod1000 = num.divmod(1000)
  roman += r1000[mod1000[0]]
  mod100 = mod1000[1].divmod(100)
  roman += r100[mod100[0]]
  mod10 = mod100[1].divmod(10)
  roman += r10[mod10[0]]
  roman + r1[mod10[1]]
end

def roman_to_int(roman)
  ret = 0
  last = 1000

  roman.chars { |c|
    current = _roman_to_int(c)
    # ret -= last * 2 if last < current
    # ret += current

    # Cancel the previous addition of the last number and
    # subtract the number if...
    ret += current - ((last * 2) * (last - current)[10])

    last = current
  }

  ret
end

def _roman_to_int(c)
  case c
  when 'I' then
    1
  when 'V' then
    5
  when 'X' then
    10
  when 'L' then
    50
  when 'C' then
    100
  when 'D' then
    500
  when 'M' then
    1000
  else
    raise "Unknown roman numeral \'" + c + "\'"
  end
end

def _check_roman_format(roman)

end

# --------------------
# 
# --------------------
# IIIII -> V
# VV -> X
# XXXXX -> L
# LL -> C
# CCCCC -> D
# DD -> M
#
# --------------------
# Subtraction rules
# --------------------
# IIII -> IV
# VIIII -> IX
# XXXX -> XL
# LXXXX -> XC
# CCCC -> CD
# DCCCC -> CM
#
def shrink5(src, dst5)

  lambda { |roman|
    dst4 = src + dst5
    ret = ""
    run = 0

    roman.chars { |c|
      if c == src
        run += 1
        if run == 5
          ret += dst5
          run = 0
        end
      else
        ret += run != 4 ? src * run : dst4
        run = 0
        ret += c
      end
    }

#    puts ret
    ret += run != 4 ? src * run : dst4
 }
end

# --------------------
# 
# --------------------
# VV -> X
# LL -> C
# DD -> M
def shrink2(src, dst2)

  lambda { |roman|
    ret = ""
    run = 0

    roman.chars { |c|
      if c == src
        run += 1
        if run == 2
          ret += dst2
          run = 0
        end
      else
        ret += src * run
        run = 0
        ret += c
      end
    }

 #   puts ret
    ret += src * run
  }
end

main
