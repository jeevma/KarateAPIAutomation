Feature: To test the get end point of the application
  To test different get end point with different data format supported by the application

  Scenario: To get all the data from application in JSON format
    Given url 'http://localhost:9897/normal/webapi/all'
    When method get
    Then status 200

