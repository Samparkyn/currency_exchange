require 'minitest/autorun'
require 'minitest/rg'
require_relative '../lib/converter'

class TestConverter < MiniTest::Test
  
  def setup
    @converter = Converter.new(File.open('test-data.json'))
  end

  def test_get_dates
    assert_equal("2016-10-18", @converter.get_dates[0])
    assert_equal(64, @converter.get_dates.count)
  end
  
  def test_get_rates_by_date
    date = "2016-10-14"
    assert_equal({"EUR" => "1"}, @converter.get_rates_by_date(date)[0])
    assert_equal({"USD" => "1.1002"}, @converter.get_rates_by_date(date)[1])
  end
  
  def test_get_currencies
    assert_equal("EUR", @converter.get_currencies[0])
    assert_equal("USD", @converter.get_currencies[1])
  end
  
  def test_get_exchange_rate
    assert_equal(0.8172, @converter.get_exchange_rate("2016-10-14", "USD", "GBP"))
    assert_equal(0.9089, @converter.get_exchange_rate("2016-10-14", "USD", "EUR"))
    assert_equal(63.6245, @converter.get_exchange_rate("2016-10-14", "CHF", "RUB"))
    assert_equal(1.0104, @converter.get_exchange_rate("2016-10-14", "CHF", "USD"))
  end
  
  def test_get_result
    params = {"date" => "2016-10-14", "curr_from" => "EUR", "curr_to" => "USD", "amount" => "100"}
    assert_equal(110.02, @converter.get_result(params))
  end
end
