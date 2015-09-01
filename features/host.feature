Feature: Simple CRUD operation using hosts

  Scenario: Should be able to create a new host
    Given I am a logged user, at the new_host page
    And I fill in 'host_name' with 'Test'
    And I fill in 'host_address' with 'http://azsale.com.br'
    And I fill in 'host_system_user' with 'yebo'
    When I press "Create Host"
    Then I should see "Host was successfully created."

  Scenario: Should be able to read a existing host
    Given I am a logged user, at the hosts page
    When I clicked on "Show" link within "1"
    Then I should see "Test"

  Scenario: Should be able to update a existing host
    Given I am a logged user, at the hosts page
    When I clicked on "Edit" link within "1"
    And I fill in 'name' with ''
    And I fill in 'address' with 'azsale.com.br'
    And I fill in 'system user' with ''
    When I press "Update Host"
    Then I should see "Host was successfully updated."

  Scenario: Should be able to delete a host
    Given I am a logged user, at the hosts page
    When I clicked on "Destroy" link within "1"
    And I confirm popup
    Then I should see "Host was successfully deleted."
