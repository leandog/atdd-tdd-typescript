Feature: Place Order

  @Scenario
  Scenario Outline: All fields are required to complete an adoption order
    Given I have added the puppy "Brook" to my litter
    When I click on "Complete the Adoption"
    And the order form is completely filled in
    But I blank out <element>
    And I click on "Place Order"
    Then I see <error> in errors

    Examples:
      | element        | error                   |
      | order_name     | Name can't be blank     |
      | order_address  | Address can't be blank  |
      | order_email    | Email can't be blank    |
