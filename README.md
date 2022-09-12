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
