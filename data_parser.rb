require 'open-uri'
require 'nokogiri'
require 'json'

doc = Nokogiri::XML(open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml"))

data = []
nodes = doc.xpath('//*[@time]').map do |node|
  element = Hash.new
  element[:date] = node.values[0]
  element[:rates] = []
  node.children.map do |child|
    rate = Hash.new
    rate[child.values[0]] = child.values[1]
    element[:rates] << rate
  end
  data << element
end

File.write('data.json', data.to_json)
