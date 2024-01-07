@rick
Feature: Rick and Morty Get Post Examples

  Background:
    * url baseUrl

  Scenario: Check number 656 name and origin name
    Given path 'character', 656
    When method get
    And print response
    Then status 200
    And match response.name == 'Impervious to Acid SWAT Officer'
    And match response.origin.name == 'Merged Universe'

  Scenario: Get response0's specie and use is as params
    Given path 'character', 656
    When method get
    * def specie = response.species
    Then print response
    And print specie

    Given path 'character'
    # Alttaki gibi filters daha uygulanabiliyor
    # * def filterDegisken = {species: ''}
    # * karate.set('filtersDegisken', '$.species', specie) -> Yani degisken, neresine yazılacak, ne yazılacak
    # çok büyük datalarda set etmek için kullanılabilir
    And params {species: #(specie)}
    When method get
    Then print response
    Then status 200