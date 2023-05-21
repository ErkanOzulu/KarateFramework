Feature: BookIt Api test

  Background:
    * def baseUrl = 'https://cybertek-reservation-api-qa3.herokuapp.com'

    #point another feature file
    * def AuthFeature = call read('classpath:features/BookItAuth.feature')
    * def accessToken = AuthFeature.token
    * print 'Token From Background',accessToken

    @wip
    Scenario: get user information
      Given url baseUrl
      And path '/api/users/me'
      And header Authorization = 'Bearer' + accessToken
      And header Accept = 'application/json'
      When method GET
      Then status 200
      And print response