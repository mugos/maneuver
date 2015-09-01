Feature: Create app
  User should be abble to create an app

  Scenario: New app
    Given user can create a new app
    And insert correct data
    When he presses the button
    Then it should create a new app
