Feature: Contact Us
  Background: View Contact Us form
    Given I am on the home page
    When I click on the email icon

  @Scenario
  Scenario: Submit a message
    And I fill the form in with the following values
      | contact_message_name  | Sad Puppy                                          |
      | contact_message_email | puppy@puppy.com                                    |
      | contact_message_body  | I am having trouble adopting a puppy. Please help! |
    And I click on "Send"
    Then I see "Thank you for contacting us!"
  