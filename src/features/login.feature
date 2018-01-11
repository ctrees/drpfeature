Feature: RackN UX Portal Login Test
    As a RackN Community User
    I want to test the RackN-Portal login
    So I have confidence in the accessablity and security of the RackN-Portal

    Scenario: github-network-check
        Given I open the url "https://github.com/"
        Then  the title is "The world's leading software development platform · GitHub"


    Scenario: feature-drp-ux-check-install
        Given I am an anonymous user at the RackN-Portal
        When  I click the RackN-UX button "RackN Portal Login"
        Then  I expect the url to contain "amazoncognito.com"
        And   the title is "Signin"
##        When  I set "gobblygook@horseoff.com" to the inputfield "#username"
##        And   I set "BadPass" to the inputfield "#password"
        When  I attempt RackN-Login with username "gobblygook@horseoff.com" and password "BadPass"
#        And   I click the "Sign In" button
        Then  I expect that element "p#loginErrorMessage" becomes visible
        And   I expect that element "p#loginErrorMessage" does appear exactly "2" times
#        Then  I expect that element "p#loginErrorMessage" matches the text "User does not exist. "
        Then  I expect that RackN-UX element "//*[@id='loginErrorMessage']" matches the text "User does not exist."

    Scenario: feature-login-test-user
        Given I am an anonymous user at the RackN-Portal
        When  I click the RackN-UX button "RackN Portal Login"
        Then  I expect the url to contain "amazoncognito.com"
        And   the title is "Signin"
        When  I attempt RackN-Login with username "test@horseoff.com" and password "GoodUser1"
        Then  I expect that element "//*[@id='header']/div[2]/div/div/div[1]" becomes visible
        And   I expect that element "//*[@id='header']/div[2]/div/div/div[1]" does appear exactly "1" times
#        Then  I expect that element "p#loginErrorMessage" matches the text "User does not exist. "
        And   I pause for 5000ms
        Then  I wait on element "//*[@id='header']/div[2]/div/div/div[1]" for 5000ms to be visible
        Then  I expect that element "//*[@id='header']/div[2]/div/div/div[1]" matches the text "test@horseoff.com"
