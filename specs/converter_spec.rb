require 'minitest/autorun'
require 'minitest/rg'
require_relative '../lib/converter'

class TestConverter < MiniTest::Test
  
  def setup
    @converter = Converter.new(File.open('test-data.json'))
  end

  def test_get_dates
    assert_equal("2016-10-14", @converter.get_dates[0])
    assert_equal(65, @converter.get_dates.count)
  end
  
  def test_get_rates_by_date
    date = "2016-10-14"
    assert_equal(date, @converter.get_rates_by_date(date)['date'])
    assert_equal({"USD" => "1.1002"}, @converter.get_rates_by_date(date)['rates'][0])
  end
  
  def test_get_currencies
    assert_equal("USD", @converter.get_currencies[0])
    assert_equal("JPY", @converter.get_currencies[1])
  end
end
