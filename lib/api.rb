require 'httparty'
require 'json'

class Api
  def initialize(api_key)
    @api_endpoint = 'https://api.vatzen.com/v1/'
    @headers = {
      'x-api-key'  => api_key,
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }
  end

  def api_get(path, query = {})
    response = HTTParty.get(@api_endpoint + path, :query => query, :headers => @headers)
    response.parsed_response
  end

  def api_post(path, body = {}, query = {})
    response = HTTParty.post(@api_endpoint + path, :body => body.to_json, :query => query, :headers => @headers)
    response.parsed_response
  end
end
