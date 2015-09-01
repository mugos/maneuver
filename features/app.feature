Feature: Create app
  User should be abble to create an app

  Scenario: There is a new app that the user wants to deploy 
    Given the user will create the app Maneuver 
    When he/she inserts the app info 
    And this data is validated
    Then the app should be created
