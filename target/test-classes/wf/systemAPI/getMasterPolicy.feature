Feature: Fetching master policy details through GET call in policy-group-rs

  Background:
    * url baseUrl
    * header Authorization = call read('basic-auth.js')
    #*  header Authorization = call read('basic-auth.js') { username: 'qa', password: 'qa' }
  @reg
  Scenario Outline: Validate get master policy details for given Claim ID : <Policy_number>
    Given path 'policy-group-rs/v1/master-policies/<Policy_number>'
    When method GET
    Then status 200
    Then print response
     # * match response == '#array'
    * print '=========Validating field values in response================= :'
    * match response.policyNumber == '<Policy_number>'
    * match response.customerNumber == '<exp_customerNumber>'
    * match response.policyStatusCd == '<exp_policyStatusCd>'
    * match response.coverages[0].coverageCd == '<exp_coverageCd>'

    Examples:
      | Policy_number | exp_customerNumber | exp_policyStatusCd | exp_coverageCd      |
      | MP0001002000  | 510005             | issued             | ACCIDENT_1          |
      | MP0000700583  | 510005             | issued             | STD                 |
      | MP0000707203  | 510005             | issued             | HOSPITAL_INDEMNITY_3|
      | MP0000700575  | 510005             | issued             | BASIC_10            |
