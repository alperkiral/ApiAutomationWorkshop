Feature: Albums

  Background:
    * url baseUrl

  Scenario: Get Albums
    Given path 'albums'
    When method get
    And print response
    Then status 200
    * def id = response[0].id

    Given path 'albums', id
    When method get
    And print response
    Then status 200
