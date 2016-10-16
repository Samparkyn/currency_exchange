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
end
