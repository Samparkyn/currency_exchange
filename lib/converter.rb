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
  
  
  def get_exchange_rate(date, curr_from, curr_to)
    rates = get_rates_by_date(date)
    rate_from = rates.map { |x| x[curr_from] }
    rate_to = rates.map { |x| x[curr_to] }
    exchange_rate = (rate_to.compact[0].to_f / rate_from.compact[0].to_f).round(4)
    return exchange_rate
  end
  
  
  def get_result(params)
    date = params['date']
    curr_from = params['curr_from']
    curr_to = params['curr_to']
    amount = params['amount'].to_f
    exchange_rate = get_exchange_rate(date, curr_from, curr_to)
    result = (amount * exchange_rate).round(2)
    return result
  end
end
  
  
