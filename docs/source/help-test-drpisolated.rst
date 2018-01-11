
help-test-drpisolated
=====================
Based on drp-quickstart_ to set up drp in the drpisolated sub-directory for testing.

#. Preparation
    #. Verify only ONE DHCP Server on a local subnet
    #. Set DRP endpoint via --static-ip=<yourIP> option in drp-cli
    #. Prepare test machines to PXE boot on the above network
    #. Load jq tool "brew install jq"  "pip install jq"

#. Preparation - My Experience::

    catmini:drpisolated msops$ brew install libarchive --force
    catmini:drpisolated msops$ brew link libarchive --force
    catmini:drpisolated msops$ brew install p7zip
    
#. Install
    .. note:: curl -fsSL get.rebar.digital/tip | bash -s -- --isolated --drp-version=tip install

#. Install - My Experience::

    catmini:drpisolated msops$ curl -fsSL get.rebar.digital/tip | bash -s -- --isolated --drp-version=tip install
    Overriding DRP_VERSION with tip
    'dr-provision' service is not running, beginning install process ... 
    Ensuring required tools are installed
    Installing Version tip of Digital Rebar Provision
    dr-provision.zip: OK
    ./bin/linux/amd64/drpcli: OK
    ./bin/linux/amd64/dr-provision: OK
    ./bin/linux/amd64/incrementer: OK
    ./bin/linux/arm64/drpcli: OK
    ./bin/linux/arm64/dr-provision: OK
    ./bin/linux/arm64/incrementer: OK
    ./bin/linux/arm_v7/drpcli: OK
    ./bin/linux/arm_v7/dr-provision: OK
    ./bin/linux/arm_v7/incrementer: OK
    ./bin/darwin/amd64/drpcli: OK
    ./bin/darwin/amd64/dr-provision: OK
    ./bin/darwin/amd64/incrementer: OK
    ./bin/windows/amd64/drpcli: OK
    ./bin/windows/amd64/dr-provision: OK
    ./bin/windows/amd64/incrementer: OK
    ./assets/startup/dr-provision.service: OK
    ./assets/startup/dr-provision.sysv: OK
    ./assets/startup/dr-provision.unit: OK
    ./tools/install.sh: OK
    Installing Version tip of Digital Rebar Provision Community Content
    drp-community-content.yaml: OK
    # Run the following commands to start up dr-provision in a local isolated way.
    # The server will store information and serve files from the drp-data directory.

    # No broadcast route set - this is required for Darwin < 10.9.
    sudo route add 255.255.255.255 192.168.1.200
    # No broadcast route set - this is required for Darwin > 10.9.
    sudo route -n add -net 255.255.255.255 192.168.1.200
    sudo ./dr-provision --static-ip=192.168.1.200 --base-root=/Users/msops/Code/drpfeature/drpisolated/drp-data --local-content="" --default-content="" &

    # Once dr-provision is started, these commands will install the isos for the community defaults
    ./drpcli bootenvs uploadiso ubuntu-16.04-install
    ./drpcli bootenvs uploadiso centos-7-install
    ./drpcli bootenvs uploadiso sledgehammer

#. Start dr-provision
    .. note:: sudo ./dr-provision --static-ip=<IP_of_provisioning_interface> --base-root=`pwd`/drp-data --local-content="" --default-content="" > drp.log 2>&1 &

#. Start dr-provision - My Experience (suggest to do without & and keep it in forground)::

    catmini:drpisolated msops$ sudo route -n add -net 255.255.255.255 192.168.1.200
    Password:
    add net 255.255.255.255: gateway 192.168.1.200
    catmini:drpisolated msops$ sudo ./dr-provision --static-ip=192.168.1.200 --base-root=/Users/msops/Code/drpfeature/drpisolated/drp-data --local-content="" --default-content=""
    [1] 18675
    catmini:drpisolated msops$ dr-provision2018/01/10 19:54:22.741401 Version: v3.5.0-tip-49-6aea7e647d6cb992e22a141ce1411a3b3af73095
    dr-provision2018/01/10 19:54:22.742107 Extracting Default Assets
    dr-provision2018/01/10 19:54:23.497339 Starting TFTP server
    dr-provision2018/01/10 19:54:23.497646 Starting static file server
    dr-provision2018/01/10 19:54:23.497766 Starting DHCP server
    dr-provision2018/01/10 19:54:23.499030 Starting PXE/BINL server
    dr-provision2018/01/10 19:54:23.499175 Starting API server        

#. Browse to API at https://192.168.1.200:8092 which redirects through https://rackn.github.io/provision-ux/#/e/192.168.1.200:8092

#. Browse to https://rackn.github.io/provision-ux/#/e/192.168.1.200:8092/isos you should see NO iso Images

#. Load iso images via command line::

    ./drpcli bootenvs uploadiso ubuntu-16.04-install
    ./drpcli bootenvs uploadiso centos-7-install
    ./drpcli bootenvs uploadiso sledgehammer

    #. The images will download and show up in the UI at https://rackn.github.io/provision-ux/#/e/192.168.1.200:8092/isos
    #. The images are downloaded to <projecthome>/drpisolated/drp-data/tftpboot/isos

#. Create subnet json - My Experience
    #. Created a local file in drpisolated directory drpisolated/local_subnet.json as follows::

        {
        "Name": "local_subnet",
        "Subnet": "192.168.1.1/24",
        "ActiveStart": "192.168.1.26",
        "ActiveEnd": "192.168.1.32",
        "NextServer": "192.168.1.1",
        "ActiveLeaseTime": 60,
        "Available": true,
        "Enabled": true,
        "Proxy": false,
        "ReadOnly": false,
        "ReservedLeaseTime": 7200,
        "Strategy": "MAC",
        "Validated": true,
        "OnlyReservations": false,
        "Pickers": [ "hint", "nextFree", "mostExpired" ],
        "Options": [
            { "Code": 1, "Value": "255.255.255.0", "Description": "Netmask" },
            { "Code": 3, "Value": "192.168.1.1", "Description": "Default Gateway" },
            { "Code": 6, "Value": "8.8.8.8", "Description": "DNS Servers" },
            { "Code": 15, "Value": "cf.cat9.com", "Description": "Domain Name" },
            { "Code": 28, "Value": "192.168.1.255", "Description": "Broadcast Address" },
            { "Code": 67, "Value": "lpxelinux.0", "Description": "Boot file name" }
        ]
        }

    #. Create subnet via drpcli via the following::

        catmini:drpisolated msops$ ./drpcli subnets create - < local_subnet.json

    #. Browse drp-ux to confirm https://rackn.github.io/provision-ux/#/e/192.168.1.200:8092/subnets
    #. Confirm via the commandline http://provision.readthedocs.io/en/tip/doc/cli/drpcli_subnets_list.html ::

        catmini:drpisolated msops$ ./drpcli subnets list
        [
        {
            "ActiveEnd": "192.168.1.32",
            "ActiveLeaseTime": 60,
            "ActiveStart": "192.168.1.26",
            "Available": true,
            "Enabled": true,
            "Errors": [],
            "Meta": {},
            "Name": "local_subnet",
            "NextServer": "192.168.1.1",
            "OnlyReservations": false,
            "Options": [
            {
                "Code": 1,
                "Value": "255.255.255.0"
            },
            {
                "Code": 3,
                "Value": "192.168.1.1"
            },
            {
                "Code": 6,
                "Value": "8.8.8.8"
            },
            {
                "Code": 15,
                "Value": "cf.cat9.com"
            },
            {
                "Code": 28,
                "Value": "192.168.1.255"
            },
            {
                "Code": 67,
                "Value": "lpxelinux.0"
            }
            ],
            "Pickers": [
            "hint",
            "nextFree",
            "mostExpired"
            ],
            "Proxy": false,
            "ReadOnly": false,
            "ReservedLeaseTime": 7200,
            "Strategy": "MAC",
            "Subnet": "192.168.1.1/24",
            "Validated": true
        }
        ]
        catmini:drpisolated msops$ 

#. Install a machine
    #. Set bootenvs
    #. PXE Boot a machine
    #. Set your bootenvs to install an opperating system
    #. Reboot the machine

.. _drp-quickstart: http://provision.readthedocs.io/en/tip/doc/quickstart.html