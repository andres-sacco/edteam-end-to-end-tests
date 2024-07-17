Feature: Reservation

  Background:
    * def contentType = 'application/json'

  Scenario: Save a reservation
    # Do a search
    * def clusters_response_ok = read('./response/clusters-response-ok.json')
    Given url clustersUrl + '/itineraries?from=BUE,MIA&to=MIA,BUE&departure=2024-09-29,2024-10-03&adults=1&children=1&infants=1&amount=10'
    And header Content-Type = contentType
    When method GET
    Then status 200
    And match response == clusters_response_ok

    # Save the reservation
    * def request_ok = read('./request/request-ok.json')
    * request_ok.searchId = response.id
    * request_ok.itineraryId = response.itineraries[0].id
    * def reservation_response_ok = read('./response/reservation-response-ok.json')

    Given url reservationUrl + '/'
    And request request_ok
    And header Content-Type = contentType
    When method POST
    Then status 201
    And match response == reservation_response_ok
    And match header Content-Type == contentType
