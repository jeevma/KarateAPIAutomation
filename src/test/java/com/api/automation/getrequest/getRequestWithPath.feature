Feature: To test the get end point of the application
  To test different get end point with different data format supported by the application

  Background: Setup the base path
    Given url 'http://localhost:9897'
    And print '======================== This is Background Keyword =============================='

  Scenario: To get all the data from application in JSON format
    Given path '/normal/webapi/all'
    When method get
    Then status 200

  Scenario: To get all the data from application in JSON format using path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200

  Scenario: To get all the data from application in XML format using the path variable
    And path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200


  Scenario: To get job description based on id and and job title
    * def query = {id:'1', jobTitle:'Software Engg'}
    Given path '/normal/webapi/find'
    And params query
    When method get
    Then status 200
    * print response

