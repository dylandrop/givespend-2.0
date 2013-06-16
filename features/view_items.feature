Feature: Viewing items
  Scenario: Viewing items through the index page
    Given the following items exist:
      | name      | price  |
      | Moby Dick | 3.00   |
      | The Crow  | 9.00   |
    When I visit the items index page
    Then I should see the following items:
      | name      | price  |
      | Moby Dick | 3.00   |
      | The Crow  | 9.00   |

  Scenario: I want to view an item
    Given the following items exist:
      | name      | price   |
      | Moby Dick | 3.00    |
    When I visit the items index page
    And I click the link for "moby_dick"
    Then I should see the following item:
      | name      | price  |
      | Moby Dick | 3.00   |