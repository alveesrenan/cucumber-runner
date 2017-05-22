Feature: Google Search

@javascript
Scenario: User searching
    Given I am on the homepage "http://www.google.com.br"
    When I see the title "Google"
        And I fill field "#lst-ib" with "Spring boot heroku"
        And I click on the button "#_fZl"
        And I wait 1 seconds to renderize page
        And I take screenshot and set filename "google-search"
    Then I should see my blog in the second result