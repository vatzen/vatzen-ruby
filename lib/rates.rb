require_relative 'api'

class Rates < Api
  def initialize(api_key)
    super(api_key)
  end

  def get_rate(country_code: nil, country_name: nil, ip_address: nil, use_client_ip: nil)
    self.api_get('rate', {
      'country_code' => country_code,
      'country_name' => country_name,
      'ip_address' => ip_address,
      'use_client_ip' => use_client_ip,
    })
  end

  def get_rates(limit: 100, page: 1)
    self.api_get('rates', {
      'limit' => limit,
      'page' => page,
    })
  end

  def get_rate_by_country_code(country_code)
    self.api_get('rate/' + country_code)
  end
end