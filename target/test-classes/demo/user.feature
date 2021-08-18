Feature: fetching User Details
  Background :
    * def expectedResult = read('../data/result.json')
  Scenario: testing the get call for User Details
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    Then print response
    And match response==expectedResult
    * match response.data.id == 2

    * print 'the value of a is:', response
    * def myNum = 5
    * print 'value is :',myNum

  Scenario: testing the get call for User Details
    Given url 'https://reqres.in/api/users/3'
    When method GET
    Then status 200
    Then print response
    * match response.data.id == 3
    * print 'the value of a is:', response
   # * match $.first_name == '#present'
   # * match $.contains {id:"#notnull",first_name:'#present'}
