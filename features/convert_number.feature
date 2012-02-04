
Feature: User can convert a number
  Scenario: User converts a new number
    Given I go to the new number page
    And I fill in "Number" with "12"
    When I press "Convert" 
    Then I should be on the converted number page
    And I should see "twelve"
