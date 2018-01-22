========================
help-drpcli-reservations
========================

Intent
  Help to set an IP reservation via drpcli and see it via the RackN-Portal_ Networking Reservations_ view.
Success
  Set a IP via mac reservation and confirm.

Manual Steps

#. Assuming a drpfeature-test-network_ with drpfeature-test-vbox_ running the drpfeature-test-drpe_ setup.
#. Check subnet config::

    [drpops@drpe drpisolated]$ ./drpcli subnets list
    [
    {
        "ActiveEnd": "192.168.88.199",
        "ActiveLeaseTime": 60,
        "ActiveStart": "192.168.88.100",
        "Available": true,
        "Enabled": true,
        "Errors": [],
        "Meta": {},
        "Name": "drpfeature-test-subnet",
        "NextServer": "192.168.88.3",
        "OnlyReservations": false,
        "Options": [
        {
            "Code": 1,
            "Value": "255.255.255.0"
        },
        {
            "Code": 3,
            "Value": "192.168.88.1"
        },
        {
            "Code": 6,
            "Value": "8.8.8.8"
        },
        {
            "Code": 15,
            "Value": "drpfeature.test"
        },
        {
            "Code": 28,
            "Value": "192.168.88.255"
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
        "Subnet": "192.168.88.0/24",
        "Validated": true
    }
    ]

#. Create a reservation::

    [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.181", "Token": "AC:16:2D:A9:C7:49", "Strategy": "MAC" }'
    {
        "Addr": "192.168.88.181",
        "Available": true,
        "Errors": [],
        "Meta": {},
        "NextServer": "",
        "Options": [],
        "ReadOnly": false,
        "Strategy": "MAC",
        "Token": "AC:16:2D:A9:C7:49",
        "Validated": true
    }

#. Check reservation via drpcli::

    [drpops@drpe drpisolated]$ ./drpcli reservations list
    [
    {
        "Addr": "192.168.88.181",
        "Available": true,
        "Errors": [],
        "Meta": {},
        "NextServer": "",
        "Options": [],
        "ReadOnly": false,
        "Strategy": "MAC",
        "Token": "AC:16:2D:A9:C7:49",
        "Validated": true
    }
    ]

#. Open RackN-Portal_ Networking -> Reservations_
    #. Verify Reservation.
#. Open RackN-Portal_ Networking -> Leases_
    #. Verify expected Reservations_ were made to MAC in Leases_


Details of the drpfeature-test-network_ setup

#. Make c9r1u10ib1-cisco-switch_ interconnect bay reservation::

    [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.199", "Token": "00:23:05:81:b2:37", "Strategy": "MAC" }'

#. Make all iLO (integrated Lights Out) management IP for blades in c9r1u10-OA1_ 
    #. iLO for Blade 1 - c9r1u10b01-ILOUSE238ELJD_
    #. iLO for Blade 2 - c9r1u10b02-ILOUSE151NJDP_
    #. iLO for Blade 3 - c9r1u10b03-ILOUSE238ELJC_
    #. iLO for Blade 4 - c9r1u10b04-ILOUSE202RFN2_
    #. drpcli reservations::

        [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.181", "Token": "ac:16:2d:a9:c7:49", "Strategy": "MAC" }'
        [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.182", "Token": "44:1e:a1:51:d8:d3", "Strategy": "MAC" }'
        [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.183", "Token": "ac:16:2d:c1:7a:03", "Strategy": "MAC" }'
        [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.184", "Token": "e4:11:5b:d3:4c:84", "Strategy": "MAC" }'

#. Make server NIC Reservations::
    #. drpcli reservations::

        [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.101", "Token": "ac:16:2d:af:e0:20", "Strategy": "MAC" }'
        [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.102", "Token": "e4:11:5b:d0:83:78", "Strategy": "MAC" }'
        [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.103", "Token": "ac:16:2d:c0:be:58", "Strategy": "MAC" }'
        [drpops@drpe drpisolated]$ ./drpcli reservations create '{ "Addr": "192.168.88.104", "Token": "e4:11:5b:dc:12:40", "Strategy": "MAC" }'

Video Track

**No Video Track yet**

.. _c9r1u10-OA1: https://192.168.88.9/
.. _c9r1u10ib1-cisco-switch: http://192.168.88.199/
.. _c9r1u10b01-ILOUSE238ELJD: https://192.168.88.181
.. _c9r1u10b02-ILOUSE151NJDP: https://192.168.88.182
.. _c9r1u10b03-ILOUSE238ELJC: https://192.168.88.183
.. _c9r1u10b04-ILOUSE202RFN2: https://192.168.88.184

.. _drpcli_reservations: http://provision.readthedocs.io/en/latest/doc/cli/drpcli_reservations.html


.. _drpfeature-test-drpe: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-drpe.html
.. _drpfeature-test-network: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-network.html
.. _drpfeature-test-macosx: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-macosx.html
.. _drpfeature-test-vbox: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-vbox.html
.. _drpfeature-test: http://drpfeature.readthedocs.io/en/latest/drpfeature-test.html
.. _drp-quickstart: http://provision.readthedocs.io/en/tip/doc/quickstart.html


Endpoint Menu System of a RackN-Portal_ 

#. System
    #. Overview_
    #. Machines_
    #. `Bulk Actions`_
    #. Plugins_
    #. `Info & Preferences`_
#. Networking
    #. Subnets_
    #. Leases_
    #. Reservations_
#. Provision
    #. `Boot Enviroments`_
    #. Templates_
    #. Params_
    #. Profiles_
#. Control
    #. Workflow_
    #. Stages_
    #. Tasks_
    #. Jobs_
#. Syncronize & Upload
    #. `Content Packages`_
    #. `Boot ISOs`_
    #. `Plugin Providers`_
    #. `Suport Files`_
#. Endpoint Admin
    #. Users_
    #. Logs_
    #. Logout_


.. _RackN-Portal: https://192.168.88.9:8092

.. _Overview: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/overview
.. _Machines: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/machines
.. _`Bulk Actions`: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/bulk
.. _Plugins: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/plugins
.. _`Info & Preferences`: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/system

.. _Subnets: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/subnets
.. _Leases: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/leases
.. _Reservations: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/reservations

.. _`Boot Enviroments`: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/bootenvs
.. _Templates: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/templates
.. _Params: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/params
.. _Profiles: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/profiles

.. _Workflow: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/workflow
.. _Stages: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/stages
.. _Tasks: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/tasks
.. _Jobs: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/jobs

.. _`Content Packages`: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/content
.. _`Boot ISOs`: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/isos
.. _`Plugin Providers`: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/providers
.. _`Suport Files`: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/files

.. _Users: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8093/users
.. _Logs: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092/logs
.. _Logout: https://rackn.github.io/provision-ux/#/e/192.168.88.3:8092

