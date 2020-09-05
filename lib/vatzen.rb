require_relative 'rates'
require_relative 'validation'
require_relative 'prices'

class Vatzen
  def initialize(api_key)
    @rates = Rates.new(api_key)
    @validation = Validation.new(api_key)
    @prices = Prices.new(api_key)
  end

  attr_accessor :rates, :validation, :prices
end
