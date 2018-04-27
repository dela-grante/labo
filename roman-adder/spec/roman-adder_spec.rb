#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'rspec'
require_relative '../src/roman-adder'

RSpec.describe do
  it "1 to 10 Roman numerals to decimal" do
    # 1 - 9
    expect(is_roman_numeral?("I")).to eq true
    expect(is_roman_numeral?("II")).to eq true
    expect(is_roman_numeral?("III")).to eq true
    expect(is_roman_numeral?("IV")).to eq true
    expect(is_roman_numeral?("V")).to eq true
    expect(is_roman_numeral?("VI")).to eq true
    expect(is_roman_numeral?("VII")).to eq true
    expect(is_roman_numeral?("VIII")).to eq true
    expect(is_roman_numeral?("IX")).to eq true

    # 10, 20, 30, 40, 50, 60, 70, 80, 90
    expect(is_roman_numeral?("X")).to eq true
    expect(is_roman_numeral?("XX")).to eq true
    expect(is_roman_numeral?("XXX")).to eq true
    expect(is_roman_numeral?("XL")).to eq true
    expect(is_roman_numeral?("L")).to eq true
    expect(is_roman_numeral?("LX")).to eq true
    expect(is_roman_numeral?("LXX")).to eq true
    expect(is_roman_numeral?("LXXX")).to eq true
    expect(is_roman_numeral?("XC")).to eq true

    # 100, 200, 300, 400, 500, 600, 700, 800, 900
    expect(is_roman_numeral?("C")).to eq true
    expect(is_roman_numeral?("CC")).to eq true
    expect(is_roman_numeral?("CCC")).to eq true
    expect(is_roman_numeral?("CD")).to eq true
    expect(is_roman_numeral?("D")).to eq true
    expect(is_roman_numeral?("DC")).to eq true
    expect(is_roman_numeral?("DCC")).to eq true
    expect(is_roman_numeral?("DCCC")).to eq true
    expect(is_roman_numeral?("CM")).to eq true

    for i in 1..3999
      roman = int_to_roman(i)
      expect(is_roman_numeral?(roman)).to eq true
      expect(roman_to_int(roman)).to eq i
    end 


    expect(is_roman_numeral?("")).to eq false
    expect(is_roman_numeral?("IIII")).to eq false
    expect(is_roman_numeral?("VIIII")).to eq false
    expect(is_roman_numeral?("VV")).to eq false
    expect(is_roman_numeral?("VIV")).to eq false
    expect(is_roman_numeral?("XXXX")).to eq false
    expect(is_roman_numeral?("LXXXX")).to eq false
    expect(is_roman_numeral?("LL")).to eq false
    expect(is_roman_numeral?("A")).to eq false
    expect(is_roman_numeral?("AI")).to eq false
    expect(is_roman_numeral?("IA")).to eq false
  end
  it "Primitive decimal to roman (1 - 9)" do
    expect(int_to_roman(1)).to eq "I"
    expect(int_to_roman(2)).to eq "II"
    expect(int_to_roman(3)).to eq "III"
    expect(int_to_roman(4)).to eq "IV"
    expect(int_to_roman(5)).to eq "V"
    expect(int_to_roman(6)).to eq "VI"
    expect(int_to_roman(7)).to eq "VII"
    expect(int_to_roman(8)).to eq "VIII"
    expect(int_to_roman(9)).to eq "IX"
  end
  it "Primitive decimal to roman (10 - 90)" do
    expect(int_to_roman(10)).to eq "X"
    expect(int_to_roman(20)).to eq "XX"
    expect(int_to_roman(30)).to eq "XXX"
    expect(int_to_roman(40)).to eq "XL"
    expect(int_to_roman(50)).to eq "L"
    expect(int_to_roman(60)).to eq "LX"
    expect(int_to_roman(70)).to eq "LXX"
    expect(int_to_roman(80)).to eq "LXXX"
    expect(int_to_roman(90)).to eq "XC"
  end
  it "Primitive decimal to roman (100 - 900)" do
    expect(int_to_roman(100)).to eq "C"
    expect(int_to_roman(200)).to eq "CC"
    expect(int_to_roman(300)).to eq "CCC"
    expect(int_to_roman(400)).to eq "CD"
    expect(int_to_roman(500)).to eq "D"
    expect(int_to_roman(600)).to eq "DC"
    expect(int_to_roman(700)).to eq "DCC"
    expect(int_to_roman(800)).to eq "DCCC"
    expect(int_to_roman(900)).to eq "CM"
  end
  it "Primitive decimal to roman (1000 - 3000)" do
    expect(int_to_roman(1000)).to eq "M"
    expect(int_to_roman(2000)).to eq "MM"
    expect(int_to_roman(3000)).to eq "MMM"
  end
  it "Some difficult pattern of Roman numerals to decimal" do
    expect(int_to_roman(12)).to eq "XII"
    expect(int_to_roman(24)).to eq "XXIV"
    expect(int_to_roman(42)).to eq "XLII"
    expect(int_to_roman(49)).to eq "XLIX"
    expect(int_to_roman(89)).to eq "LXXXIX"
    expect(int_to_roman(299)).to eq "CCXCIX"
    expect(int_to_roman(493)).to eq "CDXCIII"
    expect(int_to_roman(1960)).to eq "MCMLX"
    expect(int_to_roman(2018)).to eq "MMXVIII"
    expect(int_to_roman(3999)).to eq "MMMCMXCIX"

    expect{ int_to_roman(0) }.to raise_error(ArgumentError)
    expect{ int_to_roman(4000) }.to raise_error(ArgumentError)
    expect{ int_to_roman(-1) }.to raise_error(ArgumentError)
  end

  it "1-digit Roman numerals to decimal" do
    expect(roman_to_int("I")).to eq 1
    expect(roman_to_int("V")).to eq 5
    expect(roman_to_int("X")).to eq 10
    expect(roman_to_int("L")).to eq 50
    expect(roman_to_int("C")).to eq 100
    expect(roman_to_int("D")).to eq 500
    expect(roman_to_int("M")).to eq 1000
    expect{ roman_to_int("1") }.to raise_error(RuntimeError)
  end
  it "1 to 10 Roman numerals to decimal" do
    expect(roman_to_int("I")).to eq 1
    expect(roman_to_int("II")).to eq 2
    expect(roman_to_int("III")).to eq 3
    expect(roman_to_int("IV")).to eq 4
    expect(roman_to_int("V")).to eq 5
    expect(roman_to_int("VI")).to eq 6
    expect(roman_to_int("VII")).to eq 7
    expect(roman_to_int("VIII")).to eq 8
    expect(roman_to_int("IX")).to eq 9
    expect(roman_to_int("X")).to eq 10
  end
  it "Some difficult pattern of Roman numerals to decimal" do
    expect(roman_to_int("XII")).to eq 12
    expect(roman_to_int("XXIV")).to eq 24
    expect(roman_to_int("XLII")).to eq 42
    expect(roman_to_int("XLIX")).to eq 49
    expect(roman_to_int("LXXXIX")).to eq 89
    expect(roman_to_int("CCXCIX")).to eq 299
    expect(roman_to_int("CDXCIII")).to eq 493
    expect(roman_to_int("MCMLX")).to eq 1960
    expect(roman_to_int("MMXVIII")).to eq 2018
    expect(roman_to_int("MMMCMXCIX")).to eq 3999
  end

  it "2-digit Roman numerals to decimal" do
    expect(roman_to_int("II")).to eq 2
    expect(roman_to_int("VV")).to eq 10
    expect(roman_to_int("XX")).to eq 20
    expect(roman_to_int("LL")).to eq 100
    expect(roman_to_int("CC")).to eq 200
    expect(roman_to_int("DD")).to eq 1000
    expect(roman_to_int("MM")).to eq 2000
  end
  it "Subtraction rule" do
    expect(roman_to_int("IV")).to eq 4 # 1 - 5 = -4
    expect(roman_to_int("IX")).to eq 9 # 1 - 10 = -9
    expect(roman_to_int("XL")).to eq 40 # 10 - 50 = -40
    expect(roman_to_int("XC")).to eq 90 # 10 - 100 = -90
    expect(roman_to_int("CD")).to eq 400 # 100 - 500 = -400
    expect(roman_to_int("CM")).to eq 900 # 100 - 1000 = -900
  end
  # it "Invalid subtraction rule" do
  #   expect{ roman_to_int("IL") }.to raise_error(RuntimeError) # 1 - 50 = -49
  #   expect{ roman_to_int("IC") }.to raise_error(RuntimeError) # 1 - 100 = -99
  #   expect{ roman_to_int("ID") }.to raise_error(RuntimeError) # 1 - 500 = -499
  #   expect{ roman_to_int("IM") }.to raise_error(RuntimeError) # 1 - 1000 = -999
  #   expect{ roman_to_int("XD") }.to raise_error(RuntimeError) # 10 - 500 = -490
  #   expect{ roman_to_int("XM") }.to raise_error(RuntimeError) # 10 - 1000 = -990
  # end

  shrink5_I = shrink5("I", "V")
  shrink5_X = shrink5("X", "L")
  shrink5_C = shrink5("C", "D")

  it "Shrink rule (I)" do
    expect(shrink5_I.call("I")).to eq "I"
    expect(shrink5_I.call("II")).to eq "II"
    expect(shrink5_I.call("III")).to eq "III"
    expect(shrink5_I.call("IIII")).to eq "IV"
    expect(shrink5_I.call("IIIII")).to eq "V"
    expect(shrink5_I.call("IIIIII")).to eq "VI"
    expect(shrink5_I.call("IIIIIII")).to eq "VII"
    expect(shrink5_I.call("IIIIIIII")).to eq "VIII"
    expect(shrink5_I.call("IIIIIIIII")).to eq "VIV"
    expect(shrink5_I.call("IIIIIIIIII")).to eq "VV"
  end

  it "Shrink rule (X)" do
    expect(shrink5_X.call("X")).to eq "X"
    expect(shrink5_X.call("XX")).to eq "XX"
    expect(shrink5_X.call("XXX")).to eq "XXX"
    expect(shrink5_X.call("XXXX")).to eq "XL"
    expect(shrink5_X.call("XXXXX")).to eq "L"
    expect(shrink5_X.call("XXXXXX")).to eq "LX"
    expect(shrink5_X.call("XXXXXXX")).to eq "LXX"
    expect(shrink5_X.call("XXXXXXXX")).to eq "LXXX"
    expect(shrink5_X.call("XXXXXXXXX")).to eq "LXL"
    expect(shrink5_X.call("XXXXXXXXXX")).to eq "LL"
  end

  it "Shrink rule (C)" do
    expect(shrink5_C.call("C")).to eq "C"
    expect(shrink5_C.call("CC")).to eq "CC"
    expect(shrink5_C.call("CCC")).to eq "CCC"
    expect(shrink5_C.call("CCCC")).to eq "CD"
    expect(shrink5_C.call("CCCCC")).to eq "D"
    expect(shrink5_C.call("CCCCCC")).to eq "DC"
    expect(shrink5_C.call("CCCCCCC")).to eq "DCC"
    expect(shrink5_C.call("CCCCCCCC")).to eq "DCCC"
    expect(shrink5_C.call("CCCCCCCCC")).to eq "DCD"
    expect(shrink5_C.call("CCCCCCCCCC")).to eq "DD"
  end

  shrink2_V = shrink2("V", "X")
  shrink2_L = shrink2("L", "C")
  shrink2_D = shrink2("D", "M")

  it "Shrink rule (V)" do
    expect(shrink2_V.call("V")).to eq "V"
    expect(shrink2_V.call("VV")).to eq "X"
    expect(shrink2_V.call("VVV")).to eq "XV"
    expect(shrink2_V.call("VVVV")).to eq "XX"
    expect(shrink2_V.call("VVVVV")).to eq "XXV"
    expect(shrink2_V.call("VVVVVV")).to eq "XXX"
    expect(shrink2_V.call("VVVVVVV")).to eq "XXXV"
    expect(shrink2_V.call("VVVVVVVV")).to eq "XXXX"
    expect(shrink2_V.call("VVVVVVVVV")).to eq "XXXXV"
    expect(shrink2_V.call("VVVVVVVVVV")).to eq "XXXXX"
  end

  it "Shrink rule (L)" do
    expect(shrink2_L.call("L")).to eq "L"
    expect(shrink2_L.call("LL")).to eq "C"
    expect(shrink2_L.call("LLL")).to eq "CL"
    expect(shrink2_L.call("LLLL")).to eq "CC"
    expect(shrink2_L.call("LLLLL")).to eq "CCL"
    expect(shrink2_L.call("LLLLLL")).to eq "CCC"
    expect(shrink2_L.call("LLLLLLL")).to eq "CCCL"
    expect(shrink2_L.call("LLLLLLLL")).to eq "CCCC"
    expect(shrink2_L.call("LLLLLLLLL")).to eq "CCCCL"
    expect(shrink2_L.call("LLLLLLLLLL")).to eq "CCCCC"
  end

  it "Shrink rule (D)" do
    expect(shrink2_D.call("D")).to eq "D"
    expect(shrink2_D.call("DD")).to eq "M"
    expect(shrink2_D.call("DDD")).to eq "MD"
    expect(shrink2_D.call("DDDD")).to eq "MM"
    expect(shrink2_D.call("DDDDD")).to eq "MMD"
    expect(shrink2_D.call("DDDDDD")).to eq "MMM"
    expect(shrink2_D.call("DDDDDDD")).to eq "MMMD"
    expect(shrink2_D.call("DDDDDDDD")).to eq "MMMM"
    expect(shrink2_D.call("DDDDDDDDD")).to eq "MMMMD"
    expect(shrink2_D.call("DDDDDDDDDD")).to eq "MMMMM"
  end

  shrink_all = lambda { |roman|
    shrink2_D.call(shrink5_C.call(shrink2_L.call(shrink5_X.call(shrink2_V.call(shrink5_I.call(roman))))))
  }

  it "Shrink rule (combination)" do
    expect(shrink_all.call("I" * 10)).to eq "X"
    expect(shrink_all.call("I" * 15)).to eq "XV"
    expect(shrink_all.call("I" * 20)).to eq "XX"
    expect(shrink_all.call("I" * 25)).to eq "XXV"
    expect(shrink_all.call("I" * 30)).to eq "XXX"
    expect(shrink_all.call("I" * 35)).to eq "XXXV"
    expect(shrink_all.call("I" * 40)).to eq "XL"
    expect(shrink_all.call("I" * 45)).to eq "XLV"
    expect(shrink_all.call("I" * 50)).to eq "L"
    expect(shrink_all.call("I" * 100)).to eq "C"
    expect(shrink_all.call("I" * 500)).to eq "D"
    expect(shrink_all.call("I" * 1000)).to eq "M"

    expect(shrink_all.call("I" * 11)).to eq "XI"
    expect(shrink_all.call("I" * 16)).to eq "XVI"
    expect(shrink_all.call("I" * 21)).to eq "XXI"
    expect(shrink_all.call("I" * 26)).to eq "XXVI"
    expect(shrink_all.call("I" * 31)).to eq "XXXI"
    expect(shrink_all.call("I" * 36)).to eq "XXXVI"
    expect(shrink_all.call("I" * 41)).to eq "XLI"
    expect(shrink_all.call("I" * 46)).to eq "XLVI"
    expect(shrink_all.call("I" * 51)).to eq "LI"
    expect(shrink_all.call("I" * 101)).to eq "CI"
    expect(shrink_all.call("I" * 501)).to eq "DI"

    expect(shrink_all.call("I" * 14)).to eq "XIV"
#    expect(shrink_all.call("I" * 19)).to eq "XIX"
    expect(shrink_all.call("I" * 24)).to eq "XXIV"
#    expect(shrink_all.call("I" * 29)).to eq "XXIX"
    expect(shrink_all.call("I" * 34)).to eq "XXXIV"
#    expect(shrink_all.call("I" * 39)).to eq "XXXIX"
    expect(shrink_all.call("I" * 44)).to eq "XLIV"
#    expect(shrink_all.call("I" * 49)).to eq "XLIX"
    expect(shrink_all.call("I" * 54)).to eq "LIV"
    expect(shrink_all.call("I" * 104)).to eq "CIV"
    expect(shrink_all.call("I" * 504)).to eq "DIV"




  end

end
