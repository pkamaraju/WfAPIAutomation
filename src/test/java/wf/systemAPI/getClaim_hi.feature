Feature: fetching Claim status through GET call in WFL CLaim Core Services for HOSPITAL_INDEMNITY coverage

  Background:
    * url baseUrl
    * header Authorization = call read('basic-auth.js')
    #*  header Authorization = call read('basic-auth.js') { username: 'qa', password: 'qa' }

  @smoke
  Scenario Outline: Validate get claim response for given Claim ID : <ClaimID>
    Given path 'wfl-claims-rs/v1/claims?claimNumber=<ClaimID>'
    When method GET
    Then status 200
    Then print response
     # * match response == '#array'
    * print '=========Validating field values in response================= :'
    * match response[0].policy.policyNumber == '<exp_policyNumber>'
    * match response[0].policy.productCd == '<exp_productCd>'
    * match response[0].policy.policyStatus == '<exp_policyStatus>'
    * match response[0].policy.policyLOB == '<exp_policyLOB>'
    * match response[0].claimNumber == '<ClaimID>'
    * match response[0].claimStatusCd == '<exp_claimStatusCd>'
    * match response[0].customerNumber == '<exp_customerNumber>'

    Examples:
      | ClaimID | exp_policyNumber | exp_productCd | exp_policyStatus | exp_policyLOB | exp_claimStatusCd | exp_customerNumber |
      | C1370	| CP0000758833     | GB_HI         | ACTIVE           | HI            | INITIAL           | 514728             |
      | C1369	| CP0000758833     | GB_HI         | ACTIVE           | HI            | OPEN              | 514728             |
      | C1447	| CP0000758833     | GB_HI         | ACTIVE           | HI            | CLOSED            | 514728             |
