Feature: Fetching Customer details through GET call in wfl-claims-rs Core Services

  Background:
    * url baseUrl
    * header Authorization = call read('basic-auth.js')
    #*  header Authorization = call read('basic-auth.js') { username: 'qa', password: 'qa' }

  Scenario Outline: Validate get customer details for given Claim ID : <Customer_number>
    Given path 'customercore-rs/v1/customers/details?customerNumber=<Customer_number>'
    When method GET
    Then status 200
    Then print response
     # * match response == '#array'
    * print '=========Validating field values in response================= :'
    * match response[0].customerNumber == '<Customer_number>'
    * match response[0].customerType == '<exp_customerType>'
    * match response[0].accountNumber == '<exp_accountNumber>'
    * match response[0].customerStatus == '<exp_customerStatus>'

    Examples:
      | Customer_number | exp_customerType | exp_accountNumber | exp_customerStatus |
      | 510377          | INDV             | 610377            | CUSTOMER           |
      | 510977          | INDV             | 610977            | CUSTOMER           |


