require_relative 'api'

class Validation < Api
  def initialize(api_key)
    super(api_key)
  end

  def validate(vat_number)
    self.api_get('validate/' + vat_number)
  end

  def get_validations(params = {})
    self.api_get('validations', params)
  end

  def get_validation_by_id(id)
    self.api_get('validations/' + id)
  end
end