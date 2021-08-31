Feature: Fetching master certificate policy details through GET call in master-policies for for HOSPITAL_INDEMNITY coverage

  Background:
    * url baseUrl
    * header Authorization = call read('basic-auth.js')
    #*  header Authorization = call read('basic-auth.js') { username: 'qa', password: 'qa' }
  @reg
  Scenario Outline: Validate get master certificate policy details for given Policy number : <Master_Policy_number>
    Given path 'policy-group-rs/v1/master-policies/<master_Policy_number>/certificates?offset=0&limit=20'
    When method GET
    Then status 200
    Then print response
    * print '=========Validating field values in response================= :'
    * match response.masterPolicyNumber == '<master_Policy_number>'
    * match response.certificateDtoList[*] == '#array'
    * match response.certificateDtoList[*].customerNumber == <exp_customerNumber>
    * match response.certificateDtoList[*].policyNumber == <exp_policyNumber>
    * match response.certificateDtoList[*].primaryParticipantName == <exp_primaryParticipantName>
    Examples:
      | master_Policy_number | exp_customerNumber           | exp_policyNumber                               | exp_primaryParticipantName                |
      | MP0000707203         | ["514728","520788","520791"] | ["CP0000758833","CP0001002026","CP0001003507"] | ["Archibald Washington III","Hospital indemnity","portal all"] |

