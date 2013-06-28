# coding: utf-8

require 'rubygems'
require 'net/https'
require 'builder'
require 'base64'

require 'open-uri'

template_id = 'your-template-id'

# 埋め込む画像を準備
# ローカルの画像の場合:
#   image = File.open('/path/to/image.png')
image = open('http://repoten-api.net/assets/repoten.png')

xml = Builder::XmlMarkup.new
data = xml.pages(:type => 'array') {
  xml.page {
    xml.image(Base64.encode64(image.read))
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

