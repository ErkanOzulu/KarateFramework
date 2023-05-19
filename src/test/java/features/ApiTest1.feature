Feature: exchange rate api tests
Background:  load configuration file in Karate feature files
  * def config = karate.read('config.json')

  Scenario: basic test with status code validation
    Given url 'https://api.apilayer.com/exchangerates_data/latest'
    And header apikey = config.apikey
    When method GET
    Then status 200

  Scenario: get rates for specific day
    Given url 'https://api.apilayer.com/exchangerates_data/2022-01-01'
    And header apikey = config.apikey
    When method GET
    Then status 200

  Scenario: header verification
    Given url 'https://api.apilayer.com/exchangerates_data/2022-01-01'
    And header apikey = config.apikey
    When method GET
    And match header Content-Type == 'application/json'
    And match header Transfer-Encoding == 'chunked'
    #to verify headers we use header keyword then header name without double or single quote
    # and== 'header value'
    And match header Date == '#present'
    #this equals to headers().hasHeaderWithName("headername") in restAssured

  @wip
  Scenario: json body verification
    Given url 'https://api.apilayer.com/exchangerates_data/2022-01-01'
    And header apikey = config.apikey
    When method GET
    And match header Content-Type == 'application/json'
    And print response
    And print response.base
    #verifybase is EUR
    And match response.base == 'EUR'
    And print response.rates
    And print response.rates.USD
    And match response.rates.USD == '#present'
    And match response.rates.USD ==



