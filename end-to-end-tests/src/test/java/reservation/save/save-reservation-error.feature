Feature: Reservation

  Background:
    * url AppUrl
    * def request_error = read('./request/request-error.json')
    * def response_error = read('./response/response-error.json')
    * def contentType = 'application/json'

  Scenario: Save reservation with errors
    Given path '/'
    And request request_error
    And header Content-Type = contentType
    When method POST
    Then status 400
    And match response == response_error
    And match header Content-Type == contentType
