# coding: utf-8

require 'rubygems'
require 'net/http'
require 'builder'

template_id = 'your-template-id'

xml = Builder::XmlMarkup.new
data = xml.pages(:type => 'array') {
  xml.page {
    xml.name('John')
  }
  xml.page {
    xml.name('ジョン')
  }
}

api = Net::HTTP.new('repoten-api.net', 80)
response = api.post("/api/templates/#{template_id}.pdf", data, 
                    'Content-Type' => 'application/xml')

if response.code == '200'
  File.open('result.pdf', 'w') do |pdf|
    pdf << response.body
  end
else
  puts "Error: #{response.body}"
end
