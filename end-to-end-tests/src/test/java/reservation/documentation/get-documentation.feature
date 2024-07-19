Feature: Swagger API

  Background:
    * configure driver = { type: 'playwright-chromium' , showDriverLog: true }

  @ignore
  Scenario: Validate Swagger API
    Given driver reservationUrl + '/documentation'
    When waitFor("div.swagger-ui")
    And waitFor(".operation-tag-content")
    And click("button.download-url-button.button")
    And click(".opblock-get")
    Then match html("p") contains '<p>Operations about the reservation entity</p>'

