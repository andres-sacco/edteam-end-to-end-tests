Feature: Reservation

  Background:
    * def contentType = 'application/json'

  Scenario Outline: Get a reservation
    * def response_ok = read('./response/response-ok.json')
    * def response_error = read('./response/response-error.json')

    Given url reservationUrl + '/<id>'
    And header Content-Type = contentType
    When method GET
    Then status <responseStatus>
    And match response == <responseBody>
    And match header Content-Type == contentType

    Examples:
      | id                           | responseStatus  |  responseBody |
      | 6697e91a712b2d4d94fd2269     | 200             |  response_ok  |
      | 6697e91c712b2d4d94fd226b     | 200             |  response_ok  |
      | 6697e91c712b2d4d94fd226c     | 200             |  response_ok  |
      | 66956a5ced883a3726fe04e0     | 404             |  response_error |

