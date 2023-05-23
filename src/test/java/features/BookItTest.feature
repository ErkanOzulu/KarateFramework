Feature: BookIt Api test

  Background:
    * def baseUrl = 'https://cybertek-reservation-api-qa3.herokuapp.com'

    #point another feature file --> call read needs another feature file
    * def AuthFeature = call read('classpath:features/BookItAuth.feature')
    * def accessToken = AuthFeature.token
    * print 'Token From Background',accessToken


  Scenario: get user information
    Given url baseUrl
    And path '/api/users/me'
    And header Authorization = 'Bearer ' + accessToken
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    And match response == {"id":1590,"firstName":"Lissie","lastName":"Finnis","role":"student-team-member"}


  Scenario: get campus information
    Given url baseUrl
    And path '/api/campuses'
    And header Authorization = 'Bearer ' + accessToken
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print response
    #read the campuses.json file in the data directory
    And def expectedCampuses = read('data/campuses.json')
    And match response == expectedCampuses
