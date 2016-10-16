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
  
end
  
  
