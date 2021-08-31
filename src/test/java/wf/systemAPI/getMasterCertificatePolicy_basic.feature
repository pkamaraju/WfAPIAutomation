Feature: Fetching master certificate policy details through GET call in master-policies for BASIC_10 coverage

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
      | master_Policy_number |                             exp_customerNumber                            |                                       exp_policyNumber                                                                    |                                                     exp_primaryParticipantName                                                                |
      | MP0000700575         | ["510494","510521","510521","510200","520271","520777","520778","520791"] | ["CP0000701646","CP0000701733","CP0000701733","CP0000702652","CP0000950110","CP0001001993","CP0001001994","CP0001003506"] | ["Jennifer Finchum","JuJu Smith-Shuester","JuJu Smith-Shuester","Robert Finchum","test murshed","shah murshed","Portal testing","portal all"] |

