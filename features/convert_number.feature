
Feature: User manages books
  Scenario: User adds a new book
    Given I go to the new book page
    And I fill in "Name" with "War & Peace"
    When I press "Create" 
    Then I should be on the book list page
    And I should see "War & Peace"

Feature: User can convert a number
  Scenario: User converts a new number
    Given I go to the new number page
    And I fill in "Number" with "12"
    When I press "Convert" 
    Then I should be on the converted number page
    And I should see "twelve"
