Feature: RackN UX Portal Fresh Install Check Test
    As a RackN api Designer
    I want to test rest api call
    So I have confidence the UX guys will leave me alone

    Scenario: list-iso
        Given I am running the drp-provision endpoint from the local diretory
        When  I issue the following commad
        """
        ./drpcli isos list
        """
        Then  I should get the following responce
        """
        [
          "CentOS-7-x86_64-Minimal-1708.iso",
          "sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar",
          "ubuntu-16.04.3-server-amd64.iso"
        ]
        """

    Scenario: list-iso-files
        Given I am running the drp-provision endpoint from the local diretory
        When  I issue the following commad
        """
        tree drp-data/tftpboot/isos
        """
        Then  I should get the following responce
        """
        drp-data/tftpboot/isos
        ├── CentOS-7-x86_64-Minimal-1708.iso
        ├── sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar
        └── ubuntu-16.04.3-server-amd64.iso

        0 directories, 3 files
        """
