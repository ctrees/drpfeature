@Pending
Feature: Github Provision Issue #612
    As a Developer with current token for my provision-ux portal
    I want to fix https://github.com/digitalrebar/provision/issues/612 
    So that I can remove an inactive endpoint

Scenario: open endpoint URL
    Given I open the url "https://rackn.github.io/provision-ux/#/org/2e3ac8d5-e72e-4136-91ae-2f235b36e1cc/endpoints"
    Then  I expect that the url is "https://rackn.github.io/provision-ux/#/org/2e3ac8d5-e72e-4136-91ae-2f235b36e1cc/endpoints"
    And   I expect that the title is "RackN"

#Scenario: find endpoint to remove and remove
#    Given I open the url "https://rackn.github.io/provision-ux/#/org/2e3ac8d5-e72e-4136-91ae-2f235b36e1cc/endpoints"
#    And   the inputfield ".input-block" not contains any text
#    And   I set "webdriverio" to the inputfield ".input-block"
#    And   I press "Space"
#    And   I add "selenium" to the inputfield ".input-block"
#    When  I submit the form "#search_form"
#    Then  I expect that element ".input-block" contains the text "webdriverio selenium"
#    And   I expect that element ".repo-list-item:first-child > .repo-list-description" contains the text "Webdriver/Selenium 2.0 JavaScript bindings for Node.js"

