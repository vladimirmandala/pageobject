Feature: Products are key to our success.
  We need to be able to manage our product data.

  Scenario: Create a new product
    Given We wish to enter a new product
    When The following product is entered
      | title       | Product A       |
      | description | A great product |
    Then I should see the product listed
      | title       | Product A       |
      | description | A great product |
