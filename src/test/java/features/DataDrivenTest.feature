Feature: Data driven tests

  @wip
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
