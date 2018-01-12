Feature: RackN UX Portal Fresh Install Check Test
    As a RackN Community User
    I want to test to check a drp fresh install through RackN-Portal UX
    So I have confidence in the installation and can learn the RackN-Portal UX layout


    Scenario: github-repo-network-check
        Given I open the url "https://github.com/ctrees/drpfeature"
        Then  I expect that the url is "https://github.com/ctrees/drpfeature"
        And   I expect that the title is "GitHub - ctrees/drpfeature: Digital Rebar Provision UX Feature Testing Automation"

    Scenario: feature-login-unknown-user
        Given I am running the drp-provision endpoint with url "https://192.168.1.200:8092"
        And   I open the url "https://rackn.github.io/provision-ux/#/e/192.168.1.200:8092/isos"
#        When  I click the RackN-UX button "RackN Portal Login"
#        Then  I expect the url to contain "amazoncognito.com"
        Then   the title is "RackN"
#        And   I pause for 3000ms
        When  I set "rocketskates" to REACTjs inputfield "input[name=username]"
        And   I set "r0cketsk8ts" to REACTjs inputfield "input[name=password]"
        And   I pause for 60000ms
#        When  I set "rocketskates" to REACTjs inputfield "//input[@name='username']"
#        And   I set "r0cketsk8ts" to REACTjs inputfield "//input[@name='password']"
#        When  I attempt RackN-Login with username "rocketskates" and password "r0cketsk8ts"
#        And   I click the RackN-UX button "Login"
#prehackreverse        And  I click the RackN-UX button "button[type=submit]"
        And   I click on the button "button[type=submit]"
        And  I pause for 2000ms
        Then  I expect that element "#root > div > div:nth-child(3) > div > div > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(2)" becomes visible
#        And   I expect that element "#root > div > div:nth-child(3) > div > div > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div > table > tbody > tr:nth-child(1) > td:nth-child(2)" does appear exactly "2" times
#        Then  I expect that element "p#loginErrorMessage" matches the text "User does not exist. "
        And  I pause for 1000ms
        Then  I expect that RackN-UX REACTjs index "0" of element "td:nth-child(2)" matches the text "CentOS-7-x86_64-Minimal-1708.iso"
        And  I pause for 1000ms
        Then  I expect that RackN-UX REACTjs index "1" of element "td:nth-child(2)" matches the text "sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar"
        And  I pause for 1000ms
        Then  I expect that RackN-UX REACTjs index "2" of element "td:nth-child(2)" matches the text "ubuntu-16.04.3-server-amd64.iso"
        And  I pause for 3000ms
#        Then  I expect that RackN-UX element "td:nth-child(2)" matches the text "sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar"
#        Then  I expect that RackN-UX element "td:nth-child(2)" matches the text "ubuntu-16.04.3-server-amd64.iso"
#        And   I pause for 2000ms

#Examples:
#        |       drp-provisionIP      |      drpux-page-iso |
#        | https://192.168.1.200:8092 | https://rackn.github.io/provision-ux/#/e/192.168.1.200:8092/isos |

#    @Pending
#    Scenario: feature-login-test-user
#        Given I am an anonymous user at the RackN-Portal
#        When  I click the RackN-UX button "RackN Portal Login"
#        Then  I expect the url to contain "amazoncognito.com"
#        And   the title is "Signin"
#        When  I attempt RackN-Login with username "test@horseoff.com" and password "GoodUser1"
#        Then  I expect that element "//*[@id='header']/div[2]/div/div/div[1]" becomes visible
#        And   I expect that element "//*[@id='header']/div[2]/div/div/div[1]" does appear exactly "1" times
#        Then  I expect that element "p#loginErrorMessage" matches the text "User does not exist. "
#        And   I pause for 5000ms
#        Then  I wait on element "//*[@id='header']/div[2]/div/div/div[1]" for 5000ms to be visible
#        Then  I expect that element "//*[@id='header']/div[2]/div/div/div[1]" matches the text "test@horseoff.com"
