Feature: As a admin, I want to edit a Host

  Scenario: Create Host
    Given I am logged in as admin
    And I fill in 'name' with 'Test'
    And I fill in 'address' with 'http://azsale.com.br'
    And I fill in 'system user' with 'yebo'
    Then I should see success messages

  Scenario: Edit
    Given I am logged in as admin
    And A host exists
    And I fill in 'name' with 'Test Edited'
    Then I should see success messages

  Scenario: Validation Errors
    Given I am logged in as admin
    And A host exists
    And I edit the host with invalid data
    Then I should see validation errors
