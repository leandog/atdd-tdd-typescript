Feature: Adopt a puppy

    @Scenario
    Scenario: View the details of a puppy
        Given I am on the home page
        When I click on the puppy "Brook"
        Then I see "Adopt Me!"

    @Scenario
    Scenario: Return to the view of all available puppies
        Given I am on the home page
        When I click on the puppy "Brook"
        And I click on "Return to List"
        Then I return to the home page

    @Scenario
    Scenario: Add the puppy to my litter
        Given I am on the home page
        When I click on the puppy "Brook"
        And I click on "Adopt Me!"
        Then I see "Brook"

    @Scenario
    Scenario: Change my mind about adopting a puppy
        Given I have added the puppy "Brook" to my litter
        When I click on "Change Your Mind" in litter
        Then I return to the home page

    @Scenario
    Scenario: Add another puppy to my litter
        Given I have added the puppy "Brook" to my litter
        When I click on "Adopt Another Puppy" in litter
        And I click on the puppy "Ruby Sue"
        And I click on "Adopt Me!"
        Then I see "Ruby Sue"

    @Scenario
    Scenario: Change my mind removes all puppies from my litter
        Given I have added the puppy "Brook" to my litter
        And I click on "Adopt Another Puppy"
        And I click on the puppy "Ruby Sue"
        And I click on "Adopt Me!"
        When I click on "Change Your Mind" in litter
        Then I return to the home page
        And I see "Your cart is currently empty"

    @Scenario
    Scenario: Litter Price includes accessories
        Given I have added the puppy "Brook" to my litter
        When I add a "collar" to my order
        And I add a "toy" to my order
        Then I see "$63.93"
