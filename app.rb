require 'sinatra'
require_relative 'lib/converter'

converter = Converter.new(File.open('data.json'))

get '/' do
  @dates = converter.get_dates
  @currencies = converter.get_currencies
  erb :index
end

post '/result' do
  @result = converter.get_result(params)
  @curr_to = params['curr_from']
  erb :result
end
