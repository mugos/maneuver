Feature: Simple CRUD operation using apps
  User should be abble to create an app

  Scenario: Should be able to CREATE a new app
    Given I am a logged user
    And I fill in 'name' with 'New App'
    And I fill in 'template' with 'yebo'
    And I fill in 'system user' with 'yebo'
    And I fill in 'git' with 'git@bitbucket.org:yebo-dev/sandbox.git'
    When I press "Create"
    Then I should see "App was successfully created."

  Scenario: Should be able to UPDATE a existing app
    Given I am a logged user
    When I "Edit" app "1"
    And I fill in 'name' with 'Edited App'
    When I press "Update"
    Then I should see "App was successfully updated."

  Scenario: Should be able to DELETE an app
    Given I am a logged user
    When I "Destroy" app "1"
    And I confirm popup
    Then I should see "App was successfully deleted."
