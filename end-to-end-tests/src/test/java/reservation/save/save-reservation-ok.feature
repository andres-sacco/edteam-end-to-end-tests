Feature: Reservation

  Background:
    * url AppUrl
    * def request_ok = read('./request/request-ok.json')
    * def response_ok = read('./response/response-ok.json')
    * def contentType = 'application/json'

  Scenario: Save a reservation
    Given path '/'
    And request request_ok
    And header Content-Type = contentType
    When method POST
    Then status 201
    And match response == response_ok
    And match header Content-Type == contentType
