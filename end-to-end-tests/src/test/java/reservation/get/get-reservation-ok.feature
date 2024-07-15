Feature: Reservation

  Background:
    * url AppUrl
    * def contentType = 'application/json'
    * def response_ok = read('./response/response-ok.json')
    * def response_error = read('./response/response-error.json')

  Scenario Outline: Get a reservation
    Given path '/<id>'
    And header Content-Type = contentType
    When method GET
    Then status <responseStatus>
    And match response == <responseBody>
    And match header Content-Type == contentType

    Examples:
      | id                           | responseStatus  |  responseBody |
      | 66956a66ed883a3726fe04fa     | 200             |  response_ok  |
      | 66956a66ed883a3726fe04f9     | 200             |  response_ok  |
      | 66956a5ced883a3726fe04f8     | 200             |  response_ok  |
      | 66956a5ced883a3726fe04e0     | 404             |  response_error |

