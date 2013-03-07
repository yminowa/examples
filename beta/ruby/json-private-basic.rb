# coding: utf-8

require 'rubygems'
require 'net/https'

# Ruby 1.9 以前の場合は別途インストールが必要:
#   % gem install json
require 'json'

api_key     = 'your-api-key'
template_id = 'your-template-id'

data = {pages: [
  {name: 'John'}, 
  {name: 'ジョン'}
]}

api = Net::HTTP.new('repoten-api.net', 443)
api.use_ssl = true
api.verify_mode = OpenSSL::SSL::VERIFY_NONE

# /api/templates/xxxxxx.pdf?key=your-api-key
response = api.post("/api/templates/#{template_id}.pdf?key=#{api_key}", 
                    JSON.generate(data), 'Content-Type' => 'application/json')

if response.code == '200'
  File.open('result.pdf', 'w') do |pdf|
    pdf << response.body
  end
else
  puts "Error: #{response.body}"
end