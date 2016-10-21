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
  
  
  def exchange_rate(date, curr_from, curr_to)
    rates = get_rates_by_date(date)
    rate_from = rates.map { |x| x[curr_from] }
    rate_to = rates.map { |x| x[curr_to] }
    exchange_rate = (rate_to.compact[0].to_f / rate_from.compact[0].to_f).round(4)
    return exchange_rate
  end
  
  
  def get_rates_by_date(date)
    @data.find do |object|
      return object['rates'] if object['date'] == date
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
  
  
