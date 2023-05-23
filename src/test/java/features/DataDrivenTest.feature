Feature: Data driven tests

  Scenario Outline: get token for different '<users>'
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    And print response.accessToken
    And def token = response.accessToken

    Examples:
      | users     | email                 | password     |
      | team lead | lfinnisz@yolasite.com | lissiefinnis |
      | student   | raymond@cydeo.com     | abc123       |
      | teacher   | blyst6@si.edu         | barbabaslyst |


  Scenario Outline: get token for different '<email>'

    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    And print response.accessToken
    And def token = response.accessToken


    Examples:
      | read('data/users.csv') |



  Scenario: get user information verification (Database vs API)
    * def DBUtils = Java.type('utilities.DBUtils')
    * def query = "select id, firstname, lastname,role from users where email='lfinnisz@yolasite.com'"
    * def dbResult = DBUtils.getRowMap(query)
    * print 'DATABASE RESULT', dbResult
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'lfinnisz@yolasite.com'
    And param password = 'lissiefinnis'
    When method GET
    And print response.accessToken
    And def token = response.accessToken
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path '/api/users/me'
    And header Authorization = 'Bearer ' + token
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    And match response.id == dbResult.id
    And match response.firstName == dbResult.firstname
    And match response.lastName == dbResult.lastname
    And match response.role == dbResult.role

  @wip
  Scenario Outline: get user information verification (Database vs API) '<email>'
    * def DBUtils = Java.type('utilities.DBUtils')
    * def query = "select id, firstname, lastname,role from users where email='<email>'"
    * def dbResult = DBUtils.getRowMap(query)
    * print 'DATABASE RESULT', dbResult
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method GET
    And print response.accessToken
    And def token = response.accessToken
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path '/api/users/me'
    And header Authorization = 'Bearer ' + token
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    And match response.id == dbResult.id
    And match response.firstName == dbResult.firstname
    And match response.lastName == dbResult.lastname
    And match response.role == dbResult.role


    Examples:
      | read('data/users.csv') |