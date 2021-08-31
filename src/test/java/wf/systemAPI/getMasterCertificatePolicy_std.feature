Feature: Fetching master certificate policy details through GET call in master-policies for STD coverage

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
      | master_Policy_number |                                     exp_customerNumber                             |                                        exp_policyNumber                                                                                  |                                                        exp_primaryParticipantName                                                              |
      | MP0000700583         | ["510200","510200","510200","510200","510200","510200","520274","520274","520791"] | ["CP0000700886","CP0000700886","CP0000700886","CP0000700886","CP0000700886","CP0000700886","CP0000950153","CP0000950153","CP0001003508"] | ["Robert Finchum","Robert Finchum","Robert Finchum","Robert Finchum","Robert Finchum","Robert Finchum","Portal STD","Portal STD","portal all"] |

