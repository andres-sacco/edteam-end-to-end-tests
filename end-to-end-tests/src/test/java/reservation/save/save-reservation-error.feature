Feature: Reservation

  Background:
    * url AppUrl
    * def contentType = 'application/json'

  Scenario: Save reservation with errors
    * def request_error = read('./request/request-error.json')
    * def response_error = read('./response/response-error.json')

    Given path '/'
    And request request_error
    And header Content-Type = contentType
    When method POST
    Then status 400
    And match response == response_error
    And match header Content-Type == contentType
