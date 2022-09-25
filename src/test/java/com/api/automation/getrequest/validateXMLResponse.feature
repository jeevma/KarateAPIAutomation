Feature: To validate the GET end point
  To validate the GET end point response

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the data in JSOn format
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    And match response/List/item/jobId == 1
    And match response/List/item/experience/experience[2] == 'Apple'
    And match response/List/item/project/project/projectName == 'Movie App'
    And match response/List/item/project/project/technology/technology[2] == 'SQL Lite'
    # Skip the response keyword
    And match /List/item/experience/experience[1] == 'Google'
    # Traverse the xml similar to JSON (replace / with . and index in json starts with 0)
    And match response.List.item.experience.experience[0] == 'Google'
