Feature: Fetching Customer details through GET call in wfl-claims-rs Core Services

  Background:
    * url baseUrl
    * header Authorization = call read('basic-auth.js')
    #*  header Authorization = call read('basic-auth.js') { username: 'qa', password: 'qa' }
  @reg
  Scenario Outline: Validate get customer details for given Claim ID : <Customer_number>
    Given path 'customercore-rs/v1/customers/details?customerNumber=<Customer_number>'
    When method GET
    Then status 200
    Then print response
     # * match response == '#array'
    * print '=========Validating field values in response for Test case ID :=================<TestCase_ID>'
    * match response[0].customerNumber == '<Customer_number>'
    * match response[0].customerType == '<exp_customerType>'
    * match response[0].accountNumber == '<exp_accountNumber>'
    * match response[0].customerStatus == '<exp_customerStatus>'

    Examples:
      | read('../jsondata/WfTestData/ProcessAPI/CustomerData_1.csv') |



