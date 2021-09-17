Feature: View a puppy

    @Scenario
    Scenario: View the details of a puppy
        Given I am on the home page
        When I click on the puppy "Brook"
        Then I see "Adopt Me!"
