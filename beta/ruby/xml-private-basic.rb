# coding: utf-8

require 'rubygems'
require 'net/https'
require 'builder'

api_key     = 'your-api-key'
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

api = Net::HTTP.new('repoten-api.net', 443)
api.use_ssl = true
api.verify_mode = OpenSSL::SSL::VERIFY_NONE

# /api/templates/xxxxxx.pdf?key=your-api-key
response = api.post("/api/templates/#{template_id}.pdf?key=#{api_key}", 
                    data, 'Content-Type' => 'application/xml')

if response.code == '200'
  File.open('result.pdf', 'w') do |pdf|
    pdf << response.body
  end
else
  puts "Error: #{response.body}"
end
