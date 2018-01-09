Feature: RackN UX Portal Login Test
    As a RackN Community User
    I want to test the RackN-Portal login
    So I have confidence in the accessablity and security of the RackN-Portal

    Scenario: WTF
        Given I open the url "https://github.com/"
        Then  the title is "The world's leading software development platform · GitHub"


    Scenario: feature-login-unknown-user
        Given I am an anonymous user at the RackN-Portal
        When  I click the RackN-UX button "RackN Portal Login"
        Then  I expect the url to contain "amazoncognito.com"
        And   the title is "Signin"
##        When  I set "gobblygook@horseoff.com" to the inputfield "#username"
##        And   I set "BadPass" to the inputfield "#password"
        When  I attempt RackN-Login with username "gobblygook@horseoff.com" and password "BadPass"
#        And   I click the "Sign In" button
        Then  I expect to see "User does not exist." is visible
#
#    Scenario: feature-login-test-user
#        Given I am an anonymous user at the RackN-Portal
#        When  I click the RackN-UX button "RackN Portal Login"
#        Then  I expect the url to contain "amazoncognito.com"
#        And   the title is "Signin"
#        When  I enter the username "test@horseoff.com" and password "GoodUser1"
#        And   I click the "Sign In" button
#        Then  I expect to see "User does not exist." is visible


#div-forms > div:nth-child(2) > div:nth-child(2) > div > div > span

#loginErrorMessage