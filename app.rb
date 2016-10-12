require 'sinatra'
require_relative 'controllers/controller'

get '/' do
  erb :index
end
