# VatZen Ruby Gem

Ruby helper to connect your backend with VatZen [https://vatzen.com](https://vatzen.com). Before using the gem, we highly encourage you to check out [our official documentation](https://documentation.vatzen.com/) before using this module.

## Installation

Gem is published in RubyGems register and can be installed by following commands:

```
gem install vatzen
```

or

```
bundle add vatzen
```

# Documentation

For more extensive documentation, please visit our official docs at [https://documentation.vatzen.com](https://documentation.vatzen.com)

## General

Once you obtained your API key from [VatZen Dashboard](https://dashboard.vatzen.com), you can start using the module. To get started quickly, simply import the module and pass the API Key. After initialization, you can already start calling endpoints:

```ruby
require 'vatzen'

vatzen = Vatzen.new('your api key')

rates = vatzen.rates.get_rates(member_state: true)
```

## Rates

Before using the endpoint, you can familiarize yourself with our [Rates endpoint documentation](https://documentation.vatzen.com/api/vat-rates).

All the rates function are available inside `VatZen` object inside `rates` parameter. For example `vatzen.rates.get_rates`.

### All Rates

In order to obtain all the rates, you can use `rates.get_rates()` function, which accepts optional `options` object with the following (also optional) keys:

| key           | type      | description                                     |
|---------------|-----------|-------------------------------------------------|
| `limit`       | `number`  | Limit for pagination                            |
| `page`        | `number`  | Page number, starting from 1                    |
| `member_state` | `boolean` | Response will be filtered by member states only |

`getAll` usage example:

```ruby
vatzen.rates.get_rates(member_state: true)
```

### Rate by Country Code

If you want to obtain the rate by known ISO Country Code, you can use `rates.get_rate_by_country_code` function, which accepts country code string as a parameter. For example:

```ruby
vatzen.rates.get_rate_by_country_code('FR')
```

### Find Rate

You can use VatZen to lookup country rate using different parameters, such as country name, country code or ip address. In order to do that, you can use `rates.find` function, which accepts options object with the following properties:

| key           | type      | description                                                          |
|---------------|-----------|----------------------------------------------------------------------|
| `country_code` | `string`  | 2 characters ISO country code                                        |
| `country_name` | `string`  | Country name, for example `Germany`                                  |
| `ip_address`   | `string`  | IP Address of your client which will be used to identify the country |
| `use_client_ip` | `boolean` | If set to true, VatZen will extract ip address from the request      |

Example for using this function:

```ruby
vatzen.rates.get_rate(country_name: 'Germany')
```

## VAT Number Validation

Before using the endpoint, you can familiarize yourself with our [Validations endpoint documentation](https://documentation.vatzen.com/api/validate-vat-number).

All the rates function are available inside `VatZen` object inside `validation` parameter. For example `vatzen.validations.validate`.

### Validate VAT Number

VAT number validation is implemented inside `validate` function, which accepts only 1 parameter - vat number string. As the response, it returns the complete `Validations` entity.

Example:

```ruby
await vatzen.validation.validate('LU123455');
```

### Create Validation

If you want to validate VAT number and store the validation, you can use `create_validation` function, which accepts VAT number as a parameter and returns VAT Entity.

Example:

```ruby
vatzen.validation.create_validation('LU123455');
```

### Get validation by id

Returns stored validation object by id. Implemented in `get_validation_by_id` function.

```ruby
vatzen.validation.get_validation_by_id('dgy13wjbhbj342');
```

### Get all validation

If you want to fetch all validations, you can use `get_validations` function, which accepts optional options object with the following optional parameters:

| key           | type      | description                                     |
|---------------|-----------|-------------------------------------------------|
| `limit`       | `number`  | Limit for pagination                            |
| `page`        | `number`  | Page number, starting from 1                    |

```ruby
vatzen.validation.get_validations(page: 2)
```

## Prices Calculations

VAT prices calculations are implemented inside `prices` module in vatzen client, which you can access via `vatzen.prices`. Before using this endpoint, make sure to read our [Official Prices Documentation](https://documentation.vatzen.com/api/calculate-price).

### Calculate Price

Implemented via `vatzen.prices.calculate` function. Using this function, you can perform price calculation based on different parameters. If accepts options object, with 1 required fields: amount, and various option fields, which will be used to identify VAT rate.

| key           | type      | description                                                          |
|---------------|-----------|----------------------------------------------------------------------|
| `amount`      | `number`  | Amount for VAT calculation in cents                                  |
| `vat_included` | `boolean` | Identifies if VAT already included in amount                         |
| `category`    | `VatCategory`  | VAT Category used for price calculations                        |
| `country_code` | `string`  | 2 characters ISO country code                                        |
| `country_name` | `string`  | Country name, for example `Germany`                                  |
| `ip_address`   | `string`  | IP Address of your client which will be used to identify the country |
| `use_client_ip` | `boolean` | If set to true, VatZen will extract ip address from the request      |

Example:

```ruby
calculate_price_for_germany = vatzen.prices.calculate(
  amount: 10000,
  country_code: 'DE',
  category: 'audiobook',
)

print '100 EUR with VAT for AudioBooks in Germany: ' + (calculate_price_for_germany['amount']['total_incl_vat'] / 100).to_s
```

### Create Price Calculation

If you want to calculate price and store the calculation, you can use `create_price_calculation` function, which accepts the same parameters as `calculate` function.

Example:

```ruby
created_price_for_spain = vatzen.prices.create_price_calculation(
  amount: 10000,
  country_code: 'ES',
)

print 'Created price ID: ' + created_price_for_spain['id']
```

### Get Price Calculation by id

Returns stored price calculation object by id. Implemented in `get_calculation_by_id` function.

```ruby
vatzen.prices.get_calculation_by_id(createdPriceForSpain['id'])
```

### Get all price calculations

If you want to fetch all calculations you performed, you can use `get_prices` function, which accepts optional options object with the following optional parameters:

| key           | type      | description                                     |
|---------------|-----------|-------------------------------------------------|
| `limit`       | `number`  | Limit for pagination                            |
| `page`        | `number`  | Page number, starting from 1                    |
