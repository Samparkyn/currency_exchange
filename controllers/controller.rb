require 'sinatra'
require_relative('../models/exchange')

get '/' do
  erb :index
end
