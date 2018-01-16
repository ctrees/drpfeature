=======================
drpfeature-test-network
=======================

Intent
  This is the drpfeature-test network setup for testing drp-provision.
Success
  Network setup of an isolated so broadcast messages are easy to monitor.

Manual Steps

#. Reset the RouterBoard 750GL to default configuration using mikrotik-reset_
    #. Remove Power
    #. Press and HOLD RESET button
    #. Apply Power
    #. Wait till ACT let starts flashing
    #. Release RESET button
    #. Router will clear and restore to factory settings
#. Turn off mikrotek RouterBoard 750GL default mikrotik-dhcp_
    #. Browse to http://192.168.88.1
    #. Login - user: admin password: "" null (no password)
    #. Navigate: IP -> DHCP_Server -> DHCP
    #. Find defconf on ether2-master
    #. Click on the D (disable) button in the first column to disable this dhcp server
#. RouterBoard 750GL configuration details
    #. Port 1 - IP 192.168.88.1 (default WAN side of default 192.168.88.0/24 subnet)
    #. Port 2 - Do Not Use: Default manangement MAC
    #. Port 3 - LAN side network hub port
    #. Port 4 - LAN side network hub port
    #. Port 5 - LAN side network hub port

.. _mikrotik-reset: http://www.mikrotik.com.my/reset-to-factory-default-settings/
.. _mikrotik-dhcp: https://wiki.mikrotik.com/wiki/Manual:IP/DHCP_Server