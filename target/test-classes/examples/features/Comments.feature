Feature: Comments

  Background:
    * url baseUrl
    And header Accept-Language = 'tr'

  Scenario: Get Comments
    Given path 'comments'
    When method get
    And print response
    Then status 200

    Given path 'comments'
    And params {postId: 1}
    When method get
    And print response
    Then status 200

    Given path 'todos'
    And params {completed: true}
    When method get
    And print response
    Then status 200

