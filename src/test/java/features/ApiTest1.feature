Feature: exchange rate api tests
Background:  load configuration file in Karate feature files
  * def config = karate.read('config.json')

  Scenario: basic test with status code validation
    Given url 'https://api.apilayer.com/exchangerates_data/latest'
    And header apikey = config.apikey
    When method GET
    Then status 200
