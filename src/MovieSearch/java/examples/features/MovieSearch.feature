@movie
Feature: Searching Harry Potter and the Sorcerers Stone

  Background:
    * url baseUrl

  Scenario: Get movie ID by using 'Movie Name' and use ID to search movie
    Given path '/'
    And params {s: 'Harry Potter'}
    And params {apikey: '4de9f5a6'}
    When method get
    * def movie = get response.Search[?(@.Title== "Harry Potter and the Sorcerer's Stone")]
    * def imdbID = movie[0].imdbID
    Then print response
    Then print movie
    Then print imdbID

    Given path '/'
    And params {i: #(imdbID)}
    And params {apikey: '4de9f5a6'}
    When method get
    And print response
    Then status 200
    Then match response.Title == "Harry Potter and the Sorcerer's Stone"
    Then match response.Year == "2001"
    Then match response.Released == "16 Nov 2001"