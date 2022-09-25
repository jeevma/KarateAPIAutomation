Feature: To validate the GET end point
  To validate the GET end point response

  Background: Setup the base url
    Given url 'http://localhost:9897'

  Scenario: To get the data in JSOn format
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    And match response.[0].jobId == 1
    And match response.[0].experience[1] == 'Apple'
    And match response.[0].project[0].projectName == 'Movie App'
    And match response.[0].project[0].technology[2] == 'Gradle'
    # Validate the size of Array
    And match response.[0].experience == '#[4]'
    And match response.[0].project[0].technology == '#[3]'
    # Using wildcard char
    And match response.[0].experience[*] == ["Google","Apple","Mobile Iron","Meta"]
    And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
    # Using wildcard char with contains keyword assert a single value
    And match response.[0].experience[*] contains ["Google","Meta"]
    And match response.[0].project[0].technology[*] contains ["Gradle"]
    And match response.[*].jobId contains 1