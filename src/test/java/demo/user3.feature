Feature: fetching User Details
  Background:
    *  def expectedResult = read('../data/result.json')

Scenario: testing the get call for User Details
Given url 'https://reqres.in/api/users/2'
When method GET
Then status 200
Then print response

And match response == expectedResult
* match response.data.id == 2