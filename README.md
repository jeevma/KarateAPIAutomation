"# karate framework" 

## Table of Contents
* [Gherkin Keywords](#gherkin_keywords)
* [HTTP Methods](#http_methods)
* [Creating Runner](#creating_runner)


## Gherkin Keywords
Test is divided in 3 parts
* Setup or Prerequisite
* Action
* Validation
![Keywords](./images/keyword.png)


## HTTP Methods
* Get
* Post
* Put
* Patch
* Delete

## Creating Runner
2 Ways
```
    @Test
    public Karate runTest(){
        return Karate.run("getRequest").relativeTo(getClass());
    }

    @Test
    public Karate runTestUsingClassPath(){
        return Karate.run("classpath:com/api/automation/getrequest/getRequest.feature");
    }
```
### Path Keyword with background keyword
```
Feature: To test the get end point of the application
  To test different get end point with different data format supported by the application

  Background: Setup the base path
    Given url 'http://localhost:9897'
    And print '======================== This is Background Keyword =============================='

  Scenario: To get all the data from application in JSON format
    Given path '/normal/webapi/all'
    When method get
    Then status 200
```
### HTTP Headers
* 2 types - Request headers and Response headers
* Are additional information that client sends to the server - content type, authorization etc
* Provided in the form of key value pair

### Response Variable:
When we sent a request using Karate framework, response is captured in the response variable that can be 
used to perform additional assertions 


### Match keyword
* Used to validate the json response - in 3 ways (using dot notation)
    * validate complete response
    * Use with negate condition
    * validate a specific property in response
 ```
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
# Using wildcard char assert a collection
    And match response.[0].experience[*] == ["Google","Apple","Mobile Iron","Meta"]
    And match response.[0].project[0].technology[*] == ["Kotlin","SQL Lite","Gradle"]
# Using wildcard char with contains keyword assert a single value
```
 * Avoid using index value and user [*] wild card instead
 
 * Validate the XML response (Using xpath - http://xpather.com/)