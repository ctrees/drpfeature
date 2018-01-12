Feature: RackN UX Portal Fresh Install Check Test
    As a RackN Community User
    I want to test to check a drp fresh install through RackN-Portal UX
    So I have confidence in the installation and can learn the RackN-Portal UX layout

    Scenario: list-iso
        Given I am running the drp-provision endpoint with url <drp-provision-endpoint-ip>
        And   I open the RackN-Portal <RackN-Portal-Page> page
        Then  I should see a list of my <RackN-Portal-Page> that contains <User-eXpected-iso-name>

Examples:
      | drp-provision-endpoint     | RackN-Portal-Page | User-eXpected-iso-name                                    |
      | https://192.168.1.200:8092 | isos              | CentOS-7-x86_64-Minimal-1708.iso                          |
      | https://192.168.1.200:8092 | isos              | sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar |
      | https://192.168.1.200:8092 | isos              | ubuntu-16.04.3-server-amd64.iso                           |
