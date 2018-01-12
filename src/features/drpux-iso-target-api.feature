Feature: RackN UX Portal Fresh Install Check Test
    As a RackN api Designer
    I want to test rest api call
    So I have confidence the UX guys will leave me alone

    Scenario: list-iso
        Given I am running the drp-provision endpoint with url <drp-provision-endpoint-ip>
        When  I issue the following commad
        """
        curl -k -u rocketskates:r0cketsk8ts -X GET https://localhost:8092/api/v3/isos -H "Content-Type: application/json"
        """
        Then  I should get the following responce
        """
        ["CentOS-7-x86_64-Minimal-1708.iso","sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar","ubuntu-16.04.3-server-amd64.iso"]
        """
