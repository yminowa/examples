# coding: utf-8

require 'rubygems'
require 'net/https'
require 'active_support/core_ext'

template_id = 'your-template-id'

data = [{:name => 'John'}, {:name => 'ジョン'}].to_xml(:root => 'pages')

api = Net::HTTP.new('repoten-api.net', 443)
api.use_ssl = true
api.verify_mode = OpenSSL::SSL::VERIFY_NONE

response = api.post("/api/templates/#{template_id}.pdf", data, 
                    'Content-Type' => 'application/xml')

if response.code == '200'
  File.open('result.pdf', 'w') do |pdf|
    pdf << response.body
  end
else
  puts "Error: #{response.body}"
end
