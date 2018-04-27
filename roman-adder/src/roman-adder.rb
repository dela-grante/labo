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

  0
end

class RomanNumeral
  R1000 = ["", "M", "MM", "MMM"]
  R100 = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"]
  R10 = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"]
  R1 = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]

  ENTRY_VI = {"I" => 1, "V" => 4}
  ENTRY_LXVI = ENTRY_VI.merge({"X" => 7, "L" => 10})
  ENTRY_DCLXVI = ENTRY_LXVI.merge({"C" => 13, "D" => 16})

  STATE_TABLE = [
                 ENTRY_VI, # S0
                 {"I" => 2, "V" => 3, "X" => 3}, # S1
                 {"I" => 3}, # S2
                 {}, # S3
                 {"I" => 5}, # S4
                 {"I" => 2}, # S5

                 ENTRY_LXVI, # S6
                 {"X" => 8, "L" => 9, "C" => 9}.merge!(ENTRY_VI), # S7
                 {"X" => 9}.merge!(ENTRY_VI), # S8
                 {}.merge!(ENTRY_VI), # S9
                 {"X" => 11}.merge!(ENTRY_VI), # S10
                 {"X" => 8}.merge!(ENTRY_VI), # S11

                 ENTRY_DCLXVI, # S12
                 {"C" => 14, "D" => 15, "M" => 15}.merge!(ENTRY_LXVI), # S13
                 {"C" => 15, "X" => 7}.merge!(ENTRY_LXVI), # S14
                 {"X" => 7}.merge!(ENTRY_LXVI), # S15
                 {"C" => 17, "X" => 7}.merge!(ENTRY_LXVI), # S16
                 {"C" => 14, "X" => 7}.merge!(ENTRY_LXVI), # S17

                 {"M" => 19}.merge!(ENTRY_DCLXVI), # S18
                 {"M" => 20}.merge!(ENTRY_DCLXVI), # S19
                 {"M" => 21}.merge!(ENTRY_DCLXVI), # S20
                 {}.merge!(ENTRY_DCLXVI), # S21
                ]
  STATE_ACCEPT = [false, true, true, true, true, true,
                  false, true, true, true, true, true,
                  false, true, true, true, true, true,
                  false, true, true, true]

  def initialize(number)
    raise ArgumentError if number < 1 || number > 3999
    @number = number
    @roman = RomanNumeral.from_int(number)
  end

  def self.new_from_roman(roman)
    raise ArgumentError unless is_roman_numeral?(roman)
    RomanNumeral.new(to_int(roman))
  end

  def get_number
    @number
  end

  def get_roman
    @roman
  end

  def +(rhs)
    RomanNumeral.new_from_roman(
      RomanNumeralUtil.fold(
        RomanNumeralUtil.sort_digits(
          RomanNumeralUtil.develop(@roman) +
          RomanNumeralUtil.develop(rhs.get_roman()))))
  end

  private

  def self.from_int(num)
    roman = ""
    mod1000 = num.divmod(1000)
    roman += R1000[mod1000[0]]
    mod100 = mod1000[1].divmod(100)
    roman += R100[mod100[0]]
    mod10 = mod100[1].divmod(10)
    roman += R10[mod10[0]]
    roman + R1[mod10[1]]
  end

  def self.to_int(roman)
    ret = 0
    last = 1000

    roman.chars { |c|
      current = _to_int(c)
      # ret -= last * 2 if last < current
      # ret += current

      # Cancel the previous addition of the last number and
      # subtract the number if...
      ret += current - ((last * 2) * (last - current)[10])

      last = current
    }

    ret
  end

  def self._to_int(c)
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

  def self.is_roman_numeral?(roman)
    state = 18
    roman.chars { |c|
      state = STATE_TABLE[state][c]
      return false if state.nil?
    }

    STATE_ACCEPT[state]
  end

end

class RomanNumeralUtil
  def self.develop(roman)
    roman.sub("IV", "IIII")
      .sub("IX", "VIIII")
      .sub("XL", "XXXX")
      .sub("XC", "LXXXX")
      .sub("CD", "CCCC")
      .sub("CM", "DCCCC")
  end

  def self.fold(roman)
    combine(roman)
      .sub("VIV", "IX")
      .sub("LXL", "XC")
      .sub("DCD", "CM")
  end


  def self.sort_digits(roman)
    roman.chars.sort_by { |c|
      case c
      when 'I' then 7
      when 'V' then 6
      when 'X' then 5
      when 'L' then 4
      when 'C' then 3
      when 'D' then 2
      when 'M' then 1
      end
    }.join
  end

  private

  def self.combine(roman)
    combine2_D(combine5_C(combine2_L(combine5_X(combine2_V(combine5_I(roman))))))
  end

  def self.combine5(src, dst5)
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

      ret += run != 4 ? src * run : dst4
    }
  end

  def self.combine2(src, dst2)
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

      ret += src * run
    }
  end

  def self.combine5_I(roman)
    combine5("I", "V").call(roman)
  end

  def self.combine5_X(roman)
    combine5("X", "L").call(roman)
  end

  def self.combine5_C(roman)
    combine5("C", "D").call(roman)
  end

  def self.combine2_V(roman)
    combine2("V", "X").call(roman)
  end

  def self.combine2_L(roman)
    combine2("L", "C").call(roman)
  end

  def self.combine2_D(roman)
    combine2("D", "M").call(roman)
  end
end

main
