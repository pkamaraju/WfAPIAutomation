Feature: Fetching  certify policy details through GET call in policy-group-rs for HOSPITAL_INDEMNITY_3 coverage

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
      | Policy_number | exp_customerNumber | exp_policyStatusCd | exp_masterPolicyNumber|exp_masterPolicyCustomerNumber | exp_coverageCd           | exp_coverageName           | exp_tier |
      | CP0000758833  | 514728             | issued             | MP0000707203          |  510005                       | HOSPITAL_INDEMNITY_3     | Basic Hospital Indemnity   |   EES    |
      | CP0001002026  | 520788             | issued             | MP0000707203          |  510005                       | HOSPITAL_INDEMNITY_3     | Basic Hospital Indemnity   |   EEO    |
      | CP0001003507  | 520791             | issued             | MP0000707203          |  510005                       | HOSPITAL_INDEMNITY_3     | Basic Hospital Indemnity   |   EEO    |