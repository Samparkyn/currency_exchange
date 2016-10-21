require 'json'

class Converter
  
  attr_reader :data
  
  def initialize(data)
    @data = JSON.load(data)
  end
  
  def get_dates
    dates = []
    @data.each do |element|
      dates << element['date']
    end
    return dates
  end
  
  def convert(date, curr_from, curr_to)
    rate = get_rates_by_date(date)
    rate_from = rate[curr_from].to_i
    rate_to = rate[curr_to].to_i
    conversion = (rate_from / rate_to)
    return conversion
  end
  
  def get_rates_by_date(date)
    @data.find do |object|
      return object if object['date'] == date
    end
  end
  
  def get_currencies
    currencies = []
    @data.first['rates'].map do |rate|
      currencies << rate.keys[0]
    end
    return currencies
  end
end
  
  
