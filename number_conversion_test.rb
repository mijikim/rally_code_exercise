require 'minitest/autorun'
require_relative 'number_conversion'

class TestNumberConversion < MiniTest::Test

  def test_convert_cents_method
    amount = Converter.new(0.04)
    assert_equal "and 04/100 dollars", amount.convert_cents
  end

  def test_convert_zero_amounts
    amount = Converter.new(0)
    assert_equal "Zero dollars", amount.convert_amount_to_words
  end

  def test_get_error_message_with_negative_amounts
    amount = Converter.new(-1)
    assert_equal "Please enter a positive amount", amount.convert_amount_to_words
  end

  def test_create_number_segments
    amount = Converter.new(1345678.78)
    assert_equal [1,345,678], amount.create_number_segments
  end

  def test_convert_cents
    amount = Converter.new(0.57)
    assert_equal "57/100 dollars", amount.convert_amount_to_words
  end

  def test_convert_dollar_amounts
    amount = Converter.new(12345)
    assert_equal "Twelve thousand three hundred forty-five dollars",
                 amount.convert_amount_to_words
  end

  def test_more_convert_dollar_amounts
    amount = Converter.new(16345987)
    assert_equal "Sixteen million three hundred forty-five thousand nine hundred eighty-seven dollars",
                 amount.convert_amount_to_words
  end

  def test_convert_dollar_and_cents_amounts
    amount = Converter.new(54987.56)
    assert_equal "Fifty-four thousand nine hundred eighty-seven and 56/100 dollars",
                 amount.convert_amount_to_words
  end

  def test_more_convert_dollar_and_cents_amounts
    amount = Converter.new(2572857.05)
    assert_equal "Two million five hundred seventy-two thousand eight hundred fifty-seven and 05/100 dollars",
                 amount.convert_amount_to_words
  end
end