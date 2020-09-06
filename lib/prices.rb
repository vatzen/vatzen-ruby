require_relative 'api'

class Prices < Api
  def initialize(api_key)
    super(api_key)
  end

  def get_prices(limit: 100, page: 1)
    self.api_get('prices', {
      'limit' => limit,
      'page' => page,
    })
  end

  def create_price_calculation(amount: nil, vat_included: false, category: nil, country_code: nil, country_name: nil, ip_address: nil, use_client_ip: nil)
    raise "amount is required" if !amount

    self.api_post('prices', {}, {
      'amount' => amount,
      'vat_included' => vat_included,
      'category' => category,
      'country_code' => country_code,
      'country_name' => country_name,
      'ip_address' => ip_address,
      'use_client_ip' => use_client_ip,
    })
  end

  def calculate(amount: nil, vat_included: false, category: nil, country_code: nil, country_name: nil, ip_address: nil, use_client_ip: nil)
    raise "amount is required" if !amount

    self.api_get('price', {
      'amount' => amount,
      'vat_included' => vat_included,
      'category' => category,
      'country_code' => country_code,
      'country_name' => country_name,
      'ip_address' => ip_address,
      'use_client_ip' => use_client_ip,
    })
  end

  def get_calculation_by_id(id)
    self.api_get('prices/' + id)
  end
end