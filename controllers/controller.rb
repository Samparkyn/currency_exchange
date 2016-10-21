require 'sinatra'
require_relative '../lib/converter.rb'

get '/' do
  @converter = Converter.new(File.open('data.json'))
  @dates = @converter.get_dates
  @currencies = @converter.get_currencies
  erb :index
end
