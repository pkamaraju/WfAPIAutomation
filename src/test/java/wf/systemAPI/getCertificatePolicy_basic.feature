Feature: Fetching  policy details through GET call in policy-group-rs for basic coverage

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
    * match response.premiums[0].tier == '<exp_tier>'

    Examples:
      | Policy_number | exp_customerNumber | exp_policyStatusCd | exp_masterPolicyNumber|exp_masterPolicyCustomerNumber | exp_coverageCd | exp_coverageName            | exp_tier |
      | CP0000701646  | 510494             | issued             | MP0000700575          |  510005                       | BASIC_10       | Basic Critical Illness      |   EEO    |
      | CP0000701733  | 510521             | issued             | MP0000700575          |  510005                       | BASIC_10       | Basic Critical Illness      |   EEO    |
      | CP0000702652  | 510200             | issued             | MP0000700575          |  510005                       | BASIC_10       | Basic Critical Illness      |   EEO    |
      | CP0000950110  | 520271             | issued             | MP0000700575          |  510005                       | BASIC_10       | Basic Critical Illness      |   EEO    |
      | CP0001001993  | 520777             | issued             | MP0000700575          |  510005                       | BASIC_10       | Basic Critical Illness      |   EEO    |
      | CP0001001994  | 520778             | issued             | MP0000700575          |  510005                       | BASIC_10       | Basic Critical Illness      |   EEO    |
      | CP0001003506  | 520791             | issued             | MP0000700575          |  510005                       | BASIC_10       | Basic Critical Illness      |   EEO    |