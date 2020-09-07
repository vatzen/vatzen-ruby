require_relative 'api'

class Validation < Api
  def initialize(api_key)
    super(api_key)
  end

  def validate(vat_number)
    self.api_get('validate/' + vat_number)
  end

  def create_validation(vat_number: nil)
    raise 'vat_number is required' if !vat_number

    self.api_port('validate', {}, { 'vat_number' => vat_number })
  end

  def get_validations(limit: 100, page: 1)
    self.api_get('validations', {
      'limit' => limit,
      'page' => page,
    })
  end

  def get_validation_by_id(id)
    self.api_get('validations/' + id)
  end
end
