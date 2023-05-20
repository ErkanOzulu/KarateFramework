Feature: Parameters example

  Background:
    * def baseUrl = 'https://api.apilayer.com/exchangerates_data'
    * def SpartanUrl = 'http://3.238.70.42:8000'
    * def config = karate.read('config.json')



  Scenario: path parameters
    Given url baseUrl
    And header apikey = config.apikey
    And path 'latest'
    When method GET
    Then status 200


  Scenario: get rates for specific day
    Given url baseUrl
    And header apikey = config.apikey
    And path '2022-01-01'
    When method GET
    Then status 200

  Scenario: Validation response
    Given url SpartanUrl
    When path '/api/spartans'
    And path "10"
    When method GET
    Then status 200
    And print response
    And match response == {"gender": "Female","phone": 3312820936,"name": "Lorenza","id": 10}

  Scenario: Match with variable
    * def expectedResult =
  """
    {
    "id":10,
    "name":"Lorenza",
    "gender":"Female",
    "phone":3312820936
    }
    """
    Given url SpartanUrl
    When path '/api/spartans'
    And path "10"
    When method GET
    Then status 200
    And print response
    And match response == expectedResult

  @wip
  Scenario: query parameters
    Given url SpartanUrl
    And path "api/spartans/search"
    And param nameContains = "j"
    And param gender = "Female"
    When method GET
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And match response.totalElement == 6
    #verify each content has gender = Female
    And match each response.content contains {'gender': 'Female'}
    #second way of iteration
    And match each response.content[*].gender == 'Female'
    And match response.content[0].name == "Jaimie"
    #verify each content phone is number
    And match each response.content[*].phone == "#number"




