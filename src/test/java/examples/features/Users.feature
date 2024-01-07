@get
Feature: Get Users and Do Checks

  Background:
    * url baseUrl

  Scenario: Get Example Work - company name - address street - username
    Given path 'users'
    When method get
    * def user = response[0]
    Then status 200
    And match user.username == 'Bret'
    And match user.address.street == 'Kulas Light'
    And match user.company.name == 'Romaguera-Crona'

    And match responseType == 'json'
    And assert responseTime < 550
    And assert responseStatus == 200 || responseStatus == 201

  Scenario: Post Example Work - company name - address street - username
    Given path 'users'
    * def json = karate.read('classpath:examples/helpers/PostBody.json')
    * def userBody = json.userBody
    * userBody.username = 'HattoriHanzo'
    And request userBody
    When method post
    And status 201
    And print response
    Then match response ==
    """
    {
    "id": #number,
    "name": "#string",
    "username": "#string",
    "email": "Sincere@april.biz",
    "address": {
      "street": "#string",
      "suite": "#string",
      "city": "#string",
      "zipcode": "#string",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  }
    """


