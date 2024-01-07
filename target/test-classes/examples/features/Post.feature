@post
Feature: Post

  Background:
    * url baseUrl
    * def get = call read('classpath:examples/features/Get.feature')
    * print get
    * def title = get.firstTitle
    * print title

  Scenario: First Post Scenario
    Given path 'posts'
#    * def postBody =
#    """
#        {
#        "userId": 1,
#        "id": 1,
#        "title": #(title),
#        "body": "body"
#    }
#    """
    * def json = karate.read('classpath:examples/helpers/PostBody.json')
    * print json
    * def postBody = json.PostTitle
    * print postBody
    * postBody.title = title
    And request postBody
    When method post
    Then status 201
    And print response
