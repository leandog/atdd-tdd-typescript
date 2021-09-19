Feature: View a puppy

    @Scenario
    Scenario: View the details of a puppy
        Given I am on the home page
        When I click on the puppy "Brook"
        Then I see "Adopt Me!"

    # @Scenario
    # Scenario: Return to the view of all available puppies
    #     Given I am on the home page
    #     When I click on the puppy "Brook"
    #     And I click on "Return to List"
    #     Then I see the home page

    # @Scenario
    # Scenario: #3 Be able to add the puppy to adopt later
    #     Given I am on the home page
    #     When I click on the puppy "Brook"
    #     And I click on "Adopt Me!"
    #     Then I see the puppy "Brook" is in my litter
