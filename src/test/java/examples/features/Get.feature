@get
Feature: Get

  Background:
    * url baseUrl

  Scenario: First Get Scenario
    Given path 'posts'
    When method get
    * print response
    * def firstTitle = response[0].title
    * def id = get response[?(@.id== '1')]
    * print id
    * print firstTitle
    Then status 200
    And match firstTitle == 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'
    And match firstTitle contains 'sunt'
    And match response[0] contains {title: 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit'}

  Scenario: Get Example Work - company name - address street - username
    Given path 'users'
    When method get
    * def userUsername = response[0].username
    * def userStreet = response[0].address.street
    * def userCompanyName = response[0].company.name
    Then status 200
    And match userUsername == 'Bret'
    And match userStreet == 'Kulas Light'
    And match userCompanyName == 'Romaguera-Crona'
