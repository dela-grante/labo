#!/usr/bin/ruby
# -*- coding: utf-8 -*-

require 'rspec'
require_relative '../src/roman-adder'

RSpec.describe do
  it "RomanNumeral class" do
    r1 = RomanNumeral.new(1)
    expect(r1.get_number()).to eq 1
    expect(r1.get_roman()).to eq "I"

    r2 = RomanNumeral.new_from_roman("I")
    expect(r2.get_number()).to eq 1
    expect(r2.get_roman()).to eq "I"

    r_sum = RomanNumeral.new(10) + RomanNumeral.new(9)
    expect(r_sum.get_number()).to eq 19
    expect(r_sum.get_roman()).to eq "XIX"
  end

  it "Acceptance check for all roman numerals" do
    # 1 - 9
    expect{ RomanNumeral.new_from_roman("I") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("I") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("II") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("III") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("IV") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("V") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("VI") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("VII") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("VIII") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("IX") }.not_to raise_error

    # 10, 20, 30, 40, 50, 60, 70, 80, 90
    expect{ RomanNumeral.new_from_roman("X") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("XX") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("XXX") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("XL") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("L") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("LX") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("LXX") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("LXXX") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("XC") }.not_to raise_error

    # 100, 200, 300, 400, 500, 600, 700, 800, 900
    expect{ RomanNumeral.new_from_roman("C") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("CC") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("CCC") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("CD") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("D") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("DC") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("DCC") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("DCCC") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("CM") }.not_to raise_error

    # 1000, 2000, 3000
    expect{ RomanNumeral.new_from_roman("M") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("MM") }.not_to raise_error
    expect{ RomanNumeral.new_from_roman("MMM") }.not_to raise_error

    for i in 1..3999
      roman = RomanNumeral.new(i)
      expect(roman.get_number).to eq i
    end 

    expect {
      for i in 1..3999
        roman_i = RomanNumeral.new(i)
        3.times do
          j = rand(1..(3999 - i))
          if j.nil?
            next
          end
          roman_j = RomanNumeral.new(j)
          roman_sum = roman_i + roman_j
          expect(roman_sum.get_number).to eq i + j
        end
      end 
    }.not_to raise_error

    expect{ RomanNumeral.new_from_roman("") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("I ") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman(" I") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("i") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("IIII") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("VIIII") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("VV") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("VIV") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("XXXX") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("LXXXX") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("LL") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("LXL") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("CCCC") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("DCCCC") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("DD") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("DCD") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("MMMM") }.to raise_error(ArgumentError)

    expect{ RomanNumeral.new_from_roman("A") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("AI") }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new_from_roman("IA") }.to raise_error(ArgumentError)
  end

  it "Develop subtractions" do
    expect(RomanNumeralUtil.develop("IV")).to eq "IIII"
    expect(RomanNumeralUtil.develop("IX")).to eq "VIIII"
    expect(RomanNumeralUtil.develop("XL")).to eq "XXXX"
    expect(RomanNumeralUtil.develop("XC")).to eq "LXXXX"
    expect(RomanNumeralUtil.develop("CD")).to eq "CCCC"
    expect(RomanNumeralUtil.develop("CM")).to eq "DCCCC"

    expect(RomanNumeralUtil.develop("XIV")).to eq "XIIII"
    expect(RomanNumeralUtil.develop("XIX")).to eq "XVIIII"

  end

  it "Fold invalid subtraction" do
    expect(RomanNumeralUtil.fold("VIV")).to eq "IX"
    expect(RomanNumeralUtil.fold("LXL")).to eq "XC"
    expect(RomanNumeralUtil.fold("DCD")).to eq "CM"
    expect(RomanNumeralUtil.fold("DCDLXLVIV")).to eq "CMXCIX"
  end

  it "Sort roman numeral characters" do
    expect(RomanNumeralUtil.sort_digits("IIVXXLCCDMM")).to eq "MMDCCLXXVII"
    expect(RomanNumeralUtil.sort_digits("MDCLXVI"+"MDCLXVI")).to eq "MMDDCCLLXXVVII"
  end

  it "Primitive decimal to roman (1 - 9)" do
    expect(RomanNumeral.new(1).get_roman).to eq "I"
    expect(RomanNumeral.new(2).get_roman).to eq "II"
    expect(RomanNumeral.new(3).get_roman).to eq "III"
    expect(RomanNumeral.new(4).get_roman).to eq "IV"
    expect(RomanNumeral.new(5).get_roman).to eq "V"
    expect(RomanNumeral.new(6).get_roman).to eq "VI"
    expect(RomanNumeral.new(7).get_roman).to eq "VII"
    expect(RomanNumeral.new(8).get_roman).to eq "VIII"
    expect(RomanNumeral.new(9).get_roman).to eq "IX"
  end
  it "Primitive decimal to roman (10 - 90)" do
    expect(RomanNumeral.new(10).get_roman).to eq "X"
    expect(RomanNumeral.new(20).get_roman).to eq "XX"
    expect(RomanNumeral.new(30).get_roman).to eq "XXX"
    expect(RomanNumeral.new(40).get_roman).to eq "XL"
    expect(RomanNumeral.new(50).get_roman).to eq "L"
    expect(RomanNumeral.new(60).get_roman).to eq "LX"
    expect(RomanNumeral.new(70).get_roman).to eq "LXX"
    expect(RomanNumeral.new(80).get_roman).to eq "LXXX"
    expect(RomanNumeral.new(90).get_roman).to eq "XC"
  end
  it "Primitive decimal to roman (100 - 900)" do
    expect(RomanNumeral.new(100).get_roman).to eq "C"
    expect(RomanNumeral.new(200).get_roman).to eq "CC"
    expect(RomanNumeral.new(300).get_roman).to eq "CCC"
    expect(RomanNumeral.new(400).get_roman).to eq "CD"
    expect(RomanNumeral.new(500).get_roman).to eq "D"
    expect(RomanNumeral.new(600).get_roman).to eq "DC"
    expect(RomanNumeral.new(700).get_roman).to eq "DCC"
    expect(RomanNumeral.new(800).get_roman).to eq "DCCC"
    expect(RomanNumeral.new(900).get_roman).to eq "CM"
  end
  it "Primitive decimal to roman (1000 - 3000)" do
    expect(RomanNumeral.new(1000).get_roman).to eq "M"
    expect(RomanNumeral.new(2000).get_roman).to eq "MM"
    expect(RomanNumeral.new(3000).get_roman).to eq "MMM"
  end
  it "Some difficult pattern of Roman numerals to decimal" do
    expect(RomanNumeral.new(12).get_roman).to eq "XII"
    expect(RomanNumeral.new(24).get_roman).to eq "XXIV"
    expect(RomanNumeral.new(42).get_roman).to eq "XLII"
    expect(RomanNumeral.new(49).get_roman).to eq "XLIX"
    expect(RomanNumeral.new(89).get_roman).to eq "LXXXIX"
    expect(RomanNumeral.new(299).get_roman).to eq "CCXCIX"
    expect(RomanNumeral.new(493).get_roman).to eq "CDXCIII"
    expect(RomanNumeral.new(1960).get_roman).to eq "MCMLX"
    expect(RomanNumeral.new(2018).get_roman).to eq "MMXVIII"
    expect(RomanNumeral.new(3999).get_roman).to eq "MMMCMXCIX"

    expect{ RomanNumeral.new(0) }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new(4000) }.to raise_error(ArgumentError)
    expect{ RomanNumeral.new(-1) }.to raise_error(ArgumentError)
  end

  it "1-digit Roman numerals to decimal" do
    expect(RomanNumeral.new_from_roman("I").get_number).to eq 1
    expect(RomanNumeral.new_from_roman("V").get_number).to eq 5
    expect(RomanNumeral.new_from_roman("X").get_number).to eq 10
    expect(RomanNumeral.new_from_roman("L").get_number).to eq 50
    expect(RomanNumeral.new_from_roman("C").get_number).to eq 100
    expect(RomanNumeral.new_from_roman("D").get_number).to eq 500
    expect(RomanNumeral.new_from_roman("M").get_number).to eq 1000
    expect{ RomanNumeral.new_from_roman("1") }.to raise_error(ArgumentError)
  end
  it "1 to 10 Roman numerals to decimal" do
    expect(RomanNumeral.new_from_roman("I").get_number).to eq 1
    expect(RomanNumeral.new_from_roman("II").get_number).to eq 2
    expect(RomanNumeral.new_from_roman("III").get_number).to eq 3
    expect(RomanNumeral.new_from_roman("IV").get_number).to eq 4
    expect(RomanNumeral.new_from_roman("V").get_number).to eq 5
    expect(RomanNumeral.new_from_roman("VI").get_number).to eq 6
    expect(RomanNumeral.new_from_roman("VII").get_number).to eq 7
    expect(RomanNumeral.new_from_roman("VIII").get_number).to eq 8
    expect(RomanNumeral.new_from_roman("IX").get_number).to eq 9
    expect(RomanNumeral.new_from_roman("X").get_number).to eq 10
  end
  it "Some difficult pattern of Roman numerals to decimal" do
    expect(RomanNumeral.new_from_roman("XII").get_number).to eq 12
    expect(RomanNumeral.new_from_roman("XXIV").get_number).to eq 24
    expect(RomanNumeral.new_from_roman("XLII").get_number).to eq 42
    expect(RomanNumeral.new_from_roman("XLIX").get_number).to eq 49
    expect(RomanNumeral.new_from_roman("LXXXIX").get_number).to eq 89
    expect(RomanNumeral.new_from_roman("CCXCIX").get_number).to eq 299
    expect(RomanNumeral.new_from_roman("CDXCIII").get_number).to eq 493
    expect(RomanNumeral.new_from_roman("MCMLX").get_number).to eq 1960
    expect(RomanNumeral.new_from_roman("MMXVIII").get_number).to eq 2018
    expect(RomanNumeral.new_from_roman("MMMCMXCIX").get_number).to eq 3999
  end

  it "2-digit Roman numerals to decimal" do
    expect(RomanNumeral.new_from_roman("II").get_number).to eq 2
    expect(RomanNumeral.new_from_roman("XX").get_number).to eq 20
    expect(RomanNumeral.new_from_roman("CC").get_number).to eq 200
    expect(RomanNumeral.new_from_roman("MM").get_number).to eq 2000
  end
  it "Subtraction rule" do
    expect(RomanNumeral.new_from_roman("IV").get_number).to eq 4 # 1 - 5 = -4
    expect(RomanNumeral.new_from_roman("IX").get_number).to eq 9 # 1 - 10 = -9
    expect(RomanNumeral.new_from_roman("XL").get_number).to eq 40 # 10 - 50 = -40
    expect(RomanNumeral.new_from_roman("XC").get_number).to eq 90 # 10 - 100 = -90
    expect(RomanNumeral.new_from_roman("CD").get_number).to eq 400 # 100 - 500 = -400
    expect(RomanNumeral.new_from_roman("CM").get_number).to eq 900 # 100 - 1000 = -900
  end

  it "Combination rule (I)" do
    expect(RomanNumeralUtil.combine5_I("I")).to eq "I"
    expect(RomanNumeralUtil.combine5_I("II")).to eq "II"
    expect(RomanNumeralUtil.combine5_I("III")).to eq "III"
    expect(RomanNumeralUtil.combine5_I("IIII")).to eq "IV"
    expect(RomanNumeralUtil.combine5_I("IIIII")).to eq "V"
    expect(RomanNumeralUtil.combine5_I("IIIIII")).to eq "VI"
    expect(RomanNumeralUtil.combine5_I("IIIIIII")).to eq "VII"
    expect(RomanNumeralUtil.combine5_I("IIIIIIII")).to eq "VIII"
    expect(RomanNumeralUtil.combine5_I("IIIIIIIII")).to eq "VIV"
    expect(RomanNumeralUtil.combine5_I("IIIIIIIIII")).to eq "VV"
  end

  it "Combination rule (X)" do
    expect(RomanNumeralUtil.combine5_X("X")).to eq "X"
    expect(RomanNumeralUtil.combine5_X("XX")).to eq "XX"
    expect(RomanNumeralUtil.combine5_X("XXX")).to eq "XXX"
    expect(RomanNumeralUtil.combine5_X("XXXX")).to eq "XL"
    expect(RomanNumeralUtil.combine5_X("XXXXX")).to eq "L"
    expect(RomanNumeralUtil.combine5_X("XXXXXX")).to eq "LX"
    expect(RomanNumeralUtil.combine5_X("XXXXXXX")).to eq "LXX"
    expect(RomanNumeralUtil.combine5_X("XXXXXXXX")).to eq "LXXX"
    expect(RomanNumeralUtil.combine5_X("XXXXXXXXX")).to eq "LXL"
    expect(RomanNumeralUtil.combine5_X("XXXXXXXXXX")).to eq "LL"
  end

  it "Combination rule (C)" do
    expect(RomanNumeralUtil.combine5_C("C")).to eq "C"
    expect(RomanNumeralUtil.combine5_C("CC")).to eq "CC"
    expect(RomanNumeralUtil.combine5_C("CCC")).to eq "CCC"
    expect(RomanNumeralUtil.combine5_C("CCCC")).to eq "CD"
    expect(RomanNumeralUtil.combine5_C("CCCCC")).to eq "D"
    expect(RomanNumeralUtil.combine5_C("CCCCCC")).to eq "DC"
    expect(RomanNumeralUtil.combine5_C("CCCCCCC")).to eq "DCC"
    expect(RomanNumeralUtil.combine5_C("CCCCCCCC")).to eq "DCCC"
    expect(RomanNumeralUtil.combine5_C("CCCCCCCCC")).to eq "DCD"
    expect(RomanNumeralUtil.combine5_C("CCCCCCCCCC")).to eq "DD"
  end

  it "Combination rule (V)" do
    expect(RomanNumeralUtil.combine2_V("V")).to eq "V"
    expect(RomanNumeralUtil.combine2_V("VV")).to eq "X"
    expect(RomanNumeralUtil.combine2_V("VVV")).to eq "XV"
    expect(RomanNumeralUtil.combine2_V("VVVV")).to eq "XX"
    expect(RomanNumeralUtil.combine2_V("VVVVV")).to eq "XXV"
    expect(RomanNumeralUtil.combine2_V("VVVVVV")).to eq "XXX"
    expect(RomanNumeralUtil.combine2_V("VVVVVVV")).to eq "XXXV"
    expect(RomanNumeralUtil.combine2_V("VVVVVVVV")).to eq "XXXX"
    expect(RomanNumeralUtil.combine2_V("VVVVVVVVV")).to eq "XXXXV"
    expect(RomanNumeralUtil.combine2_V("VVVVVVVVVV")).to eq "XXXXX"
  end

  it "Combination rule (L)" do
    expect(RomanNumeralUtil.combine2_L("L")).to eq "L"
    expect(RomanNumeralUtil.combine2_L("LL")).to eq "C"
    expect(RomanNumeralUtil.combine2_L("LLL")).to eq "CL"
    expect(RomanNumeralUtil.combine2_L("LLLL")).to eq "CC"
    expect(RomanNumeralUtil.combine2_L("LLLLL")).to eq "CCL"
    expect(RomanNumeralUtil.combine2_L("LLLLLL")).to eq "CCC"
    expect(RomanNumeralUtil.combine2_L("LLLLLLL")).to eq "CCCL"
    expect(RomanNumeralUtil.combine2_L("LLLLLLLL")).to eq "CCCC"
    expect(RomanNumeralUtil.combine2_L("LLLLLLLLL")).to eq "CCCCL"
    expect(RomanNumeralUtil.combine2_L("LLLLLLLLLL")).to eq "CCCCC"
  end

  it "Combination rule (D)" do
    expect(RomanNumeralUtil.combine2_D("D")).to eq "D"
    expect(RomanNumeralUtil.combine2_D("DD")).to eq "M"
    expect(RomanNumeralUtil.combine2_D("DDD")).to eq "MD"
    expect(RomanNumeralUtil.combine2_D("DDDD")).to eq "MM"
    expect(RomanNumeralUtil.combine2_D("DDDDD")).to eq "MMD"
    expect(RomanNumeralUtil.combine2_D("DDDDDD")).to eq "MMM"
    expect(RomanNumeralUtil.combine2_D("DDDDDDD")).to eq "MMMD"
    expect(RomanNumeralUtil.combine2_D("DDDDDDDD")).to eq "MMMM"
    expect(RomanNumeralUtil.combine2_D("DDDDDDDDD")).to eq "MMMMD"
    expect(RomanNumeralUtil.combine2_D("DDDDDDDDDD")).to eq "MMMMM"
  end

  it "Combination rule (mixed)" do
    expect(RomanNumeralUtil.combine("I" * 10)).to eq "X"
    expect(RomanNumeralUtil.combine("I" * 15)).to eq "XV"
    expect(RomanNumeralUtil.combine("I" * 20)).to eq "XX"
    expect(RomanNumeralUtil.combine("I" * 25)).to eq "XXV"
    expect(RomanNumeralUtil.combine("I" * 30)).to eq "XXX"
    expect(RomanNumeralUtil.combine("I" * 35)).to eq "XXXV"
    expect(RomanNumeralUtil.combine("I" * 40)).to eq "XL"
    expect(RomanNumeralUtil.combine("I" * 45)).to eq "XLV"
    expect(RomanNumeralUtil.combine("I" * 50)).to eq "L"
    expect(RomanNumeralUtil.combine("I" * 100)).to eq "C"
    expect(RomanNumeralUtil.combine("I" * 500)).to eq "D"
    expect(RomanNumeralUtil.combine("I" * 1000)).to eq "M"

    expect(RomanNumeralUtil.combine("I" * 11)).to eq "XI"
    expect(RomanNumeralUtil.combine("I" * 16)).to eq "XVI"
    expect(RomanNumeralUtil.combine("I" * 21)).to eq "XXI"
    expect(RomanNumeralUtil.combine("I" * 26)).to eq "XXVI"
    expect(RomanNumeralUtil.combine("I" * 31)).to eq "XXXI"
    expect(RomanNumeralUtil.combine("I" * 36)).to eq "XXXVI"
    expect(RomanNumeralUtil.combine("I" * 41)).to eq "XLI"
    expect(RomanNumeralUtil.combine("I" * 46)).to eq "XLVI"
    expect(RomanNumeralUtil.combine("I" * 51)).to eq "LI"
    expect(RomanNumeralUtil.combine("I" * 101)).to eq "CI"
    expect(RomanNumeralUtil.combine("I" * 501)).to eq "DI"

    expect(RomanNumeralUtil.combine("I" * 14)).to eq "XIV"
    expect(RomanNumeralUtil.combine("I" * 24)).to eq "XXIV"
    expect(RomanNumeralUtil.combine("I" * 34)).to eq "XXXIV"
    expect(RomanNumeralUtil.combine("I" * 44)).to eq "XLIV"
    expect(RomanNumeralUtil.combine("I" * 54)).to eq "LIV"
    expect(RomanNumeralUtil.combine("I" * 104)).to eq "CIV"
    expect(RomanNumeralUtil.combine("I" * 504)).to eq "DIV"
  end
end
