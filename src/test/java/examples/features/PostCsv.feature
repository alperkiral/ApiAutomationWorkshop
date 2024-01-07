Feature: Post

  Background:
    * url baseUrl

  Scenario: Post scenario csv
    Given path 'posts'
    * def csv = karate.read('classpath:examples/helpers/PostCsv.csv')
    * print csv
    * def title = csv[0].title
    * def body = csv[0].body
    * print title
    * print body
    * def json = karate.read('classpath:examples/helpers/PostBody.json')
    * def postBody = json.PostTitle3
    * postBody.title = title
    * postBody.body = body
    And request postBody
    When method post
    Then status 201
    And print response