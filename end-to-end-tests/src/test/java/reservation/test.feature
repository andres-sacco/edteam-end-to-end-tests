Feature: Reservation

  Scenario: Save a reservation
    Given url 'http://127.0.0.1:3070/api/flights/reservation/'
    And request {"itineraryId":"35c0e8c3-ddf9-49be-ba91-bf7fda1e51cf","searchId":"TWA_g=2024-07-15T17:03:31.149626_f=BUE,MIA_t=MIA,BUE_d=2024-09-29,2024-10-03_a=1_c=1_i=1","passengers":[{"gender":"FEMALE","type":"ADULT","birthday":"2002-03-01","nationality":"AR","firstName":"Andres","lastName":"Sacco","documentNumber":"56","documentType":"2025-03-01"}]}
    And header Content-Type = 'application/json'
    When method POST
    Then status 201
    And match response.passengers == [{"firstName":"Andres","lastName":"Sacco","documentNumber":"56","documentType":"2025-03-01","birthday":"2002-03-01","nationality":"AR"}]
    And match response.itineraryId == "35c0e8c3-ddf9-49be-ba91-bf7fda1e51cf"
    And match response.id != null
    #Alternative way to do it
    #And match response == {"id": #notnull,"passengers":[{"firstName":"Andres","lastName":"Sacco","documentNumber":"56","documentType":"2025-03-01","birthday":"2002-03-01","nationality":"AR"}],"itineraryId":"35c0e8c3-ddf9-49be-ba91-bf7fda1e51cf","searchId":"TWA_g=2024-07-15T17:03:31.149626_f=BUE,MIA_t=MIA,BUE_d=2024-09-29,2024-10-03_a=1_c=1_i=1"}

    And match header Content-Type == 'application/json'