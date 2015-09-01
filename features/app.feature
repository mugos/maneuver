Feature: Manage Apps
  User should be abble to CRUD an app

  Scenario: Should be able to CREATE a new app
    Given I am a logged user
    And I want to 'create an app'
    When I go to create app
    And I fill in 'name' with 'New App'
    And I fill in 'template' with 'yebo'
    And I fill in 'system user' with 'yebo'
    And I fill in 'git' with 'git@bitbucket.org:yebo-dev/sandbox.git'
    When I save it
    Then I should see "App was successfully created."

  Scenario: Should be able to UPDATE a existing app
    Given I am a logged user
    And I want to 'edit an app'
    When I go to edit app '1'
    I should see an app with 'name' of 'New App'
    And I fill in 'name' with 'Edited App'
    When I save it
    Then I should see "App was successfully updated."
