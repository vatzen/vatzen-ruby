require_relative 'api'

class Rates < Api
  def initialize(api_key)
    super(api_key)
  end

  def get_rate(params)
    self.api_get('rate', params)
  end

  def get_rates(params = {})
    self.api_get('rates', params)
  end

  def get_rate_by_country_code(country_code)
    self.api_get('rate/' + country_code)
  end
end