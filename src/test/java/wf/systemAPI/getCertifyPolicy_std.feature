Feature: Fetching  policy details through GET call in policy-group-rs for STD coverage

  Background:
    * url baseUrl
    * header Authorization = call read('basic-auth.js')
    #*  header Authorization = call read('basic-auth.js') { username: 'qa', password: 'qa' }
  @reg
  Scenario Outline: Validate get certificate policy details for given Claim ID : <Policy_number>
    Given path 'policy-group-rs/v1/certificates/<Policy_number>'
    When method GET
    Then status 200
    Then print response
     # * match response == '#array'
    * print '=========Validating field values in response================= :'
    * match response.policyNumber == '<Policy_number>'
    * match response.customerNumber == '<exp_customerNumber>'
    * match response.policyStatusCd == '<exp_policyStatusCd>'
    * match response.masterPolicyNumber == '<exp_masterPolicyNumber>'
    * match response.masterPolicyCustomerNumber == '<exp_masterPolicyCustomerNumber>'
    * match response.coverages[0].coverageCd == '<exp_coverageCd>'
    * match response.premiums[0].coverageName == '<exp_coverageName>'

    Examples:
      | Policy_number | exp_customerNumber | exp_policyStatusCd | exp_masterPolicyNumber|exp_masterPolicyCustomerNumber | exp_coverageCd | exp_coverageName |
      | CP0000700886  | 520787             | issued             | MP0000700583          |  510005                       | STD            | STD Core         |
      | CP0000950153  | 520274             | issued             | MP0000700583          |  510005                       | STD            | STD Core         |
      | CP0001003508  | 520791             | issued             | MP0000700583          |  510005                       | STD            | STD Core         |
