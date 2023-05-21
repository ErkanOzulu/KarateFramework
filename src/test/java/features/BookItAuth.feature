Feature:get user token

  Scenario: get one user token
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = 'lfinnisz@yolasite.com'
    And param password = 'lissiefinnis'
    When method GET
    And print response.accessToken
    And def token = response.accessToken


