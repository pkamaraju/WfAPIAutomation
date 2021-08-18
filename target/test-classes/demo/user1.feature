Feature: fetching User Details

  Background:
    *  url 'https://reqres.in/api/'

  Scenario Outline: testing the get call for User Id Details
    Given path 'users/<Id>'
    When method GET
    Then status 200
    Then print response
     # * match response == '#array'
    * match response.data.id == 2
    * print 'the value of a is:', response
    * def myNum = 5
    * print 'value is :',myNum
    Examples:
      | Id |
      | 2  |
      | 3  |
      | 4  |
