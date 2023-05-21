Feature: KarateJava Integration

  Background:
    * def SpartanUrl = 'http://3.238.70.42:8000'

  Scenario:  Get a spartan with request header
    Given url SpartanUrl
    And path '/api/spartans'
    And header Accept = 'application/json'
    When method GET
    Then status 200


  Scenario: Create a new Spartan
    Given url SpartanUrl
    And path '/api/spartans'
    And header Content-Type = 'application/json'
    And request
    """
      {
    "name":"Lorenza",
    "gender":"Female",
    "phone":3312820935
    }
    """
    When method Post
    Then status 201
    And print response


  Scenario: reading java methods
#point the class that we want to run
  #Java.type --> used to connect to java class
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    * print newSpartan
    #run the static method in that class and capture the result
    #the return map object is represented as a json


  Scenario: Create a spartan with Random Data(JAVA)
    * def SDG = Java.type('utilities.SpartanDataGenerator')
    * def newSpartan = SDG.createSpartan()
    Given url SpartanUrl
    And path '/api/spartans'
    And header Content-Type = 'application/json'
    And request newSpartan
    When method Post
    Then status 201
    And print response
    And match response.success == 'A Spartan is Born!'
    #verify names
    And match response.data.name == newSpartan.name
    And def idToDelete = response.data.id
    Given url SpartanUrl
    And path '/api/spartans', idToDelete
    ## And path idToDelete
    When method Delete
    Then status 204



