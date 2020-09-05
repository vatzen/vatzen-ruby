require_relative 'api'

class Prices < Api
  def initialize(api_key)
    super(api_key)
  end

  def get_prices(params = {})
    self.api_get('prices', params)
  end

  def create_price_calculation(params)
    self.api_post('prices', {}, params)
  end

  def calculate(params)
    self.api_get('price', params)
  end

  def get_calculation_by_id(id)
    self.api_get('prices/' + id)
  end
end