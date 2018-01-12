Feature: RackN UX Portal Fresh Install Check Test
    As a RackN CSS Web Designer
    I want to test css effects through RackN-Portal UX
    So I have confidence that the user sees the desired RackN-Portal UX effect

    Scenario: list-iso
        Given I am running the drp-provision endpoint with url <drp-provision-endpoint-ip>
        And   I open the RackN-Portal <RackN-Portal-Page> page
        Then  I should see <element> with an attribute <RackN-CSS-data> containing value <value>

Examples:
      | drp-provision-endpoint     | RackN-Portal-Page | element | RackN-CSS-data     | value                            |
      | https://192.168.1.200:8092 | isos              | table   | data-rackn-api     | iso-list                         |
      | https://192.168.1.200:8092 | isos              | td      | data-rackn-api     | iso-list-item                    |
      | https://192.168.1.200:8092 | isos              | td      | data-iso-list-item | CentOS-7-x86_64-Minimal-1708.iso |
