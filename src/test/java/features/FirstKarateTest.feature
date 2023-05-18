Feature: Welcome to karate
  If you are familiar with Cucumber / Gherkin, the big difference here is that you don't need to write extra "glue" code or Java "step definitions" ! --->>   https://karatelabs.github.io/karate/

  Scenario: how to print
    Given print "Hello world"
    When print 'another print'
    Then print 'then print'

  Scenario: more printing
    Given print 'some words to print'
    * print 'my name is','karate kid'
  # , --> concat two strings +1 white space
    * print 2+2

  Scenario: variables
    * def name = 'Mike'
    * print 'my name is'+name
    * def age = 20
    * print name, 'is',age,'years old'


  Scenario: difficult parameters: json object
    * def student = {'name':'Sam', 'owes_tuition':false}
    * print student
    * print student.name
    * print student.owes_tuition


  Scenario: json object 2
    * def student =
    """
    {
   "firstName":"Steven",
   "lastName":"King",
   "salary": 2000
    }
    """
    * print student
    * print student.firstName
    * print student.lastName
    * print student.salary



  Scenario: Spartan Variable
    * def spartan =
    """
    {
    "id": 10,
    "name": "Lorenza",
    "gender": "Female",
    "phone": 3312820936
    }
    """
    * print spartan.id
    * print spartan.name
    * print spartan.gender
    * print spartan.phone

  @wip
  Scenario: json array objects
    * def students =
    """
    [
    {
    'name':'Sam',
    'owes_tuition':false
    }
    {
    'name':'Mike',
    'owes_tuition':true
    }
    ]
    """
    * print students
    * print students[0]
    * print students[0].name
    * print students[1].owes_tuition





