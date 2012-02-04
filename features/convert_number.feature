
Feature: User can convert a number
  Scenario: User converts a new number
    Given I go to the new number page
    And I fill in "Number" with "12"
    When I press "Convert" 
    Then I should be on the converted number page
    And I should see "Original number: 12"
    And I should see "Converted number: twelve"
    
  Scenario: User converts a different number
    Given I go to the new number page
    And I fill in "Number" with "11"
    When I press "Convert" 
    Then I should be on the converted number page
    And I should see "Original number: 11"
    And I should see "Converted number: eleven"
    
