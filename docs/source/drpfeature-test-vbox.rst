=======================
drpfeature-test-vbox
=======================

Intent
  This is the drpfeature-test vbox setup for testing drp-provision.
Success
  vbox setup for PXE boot nodes on an isolated network so broadcast messages are easy to monitor.

Manual Steps

#. Setup network configuration using drpfeature-test-network_
#. Install VirtualBox_ on drpfeature-test-macosx_
#. Start VirtualBox_
#. Configure PXE Bare Metal Node bm1
    #. New -> Name: bm1 - Type: Linux - OS: RedHat 64-bit
    #. Memory -> 1024 MB
    #. HD -> 8 GB
    #. CPU -> 2
    #. Network -> Attached to: Bridged Adaptor - Name: en0: Ethernet - Promiscuous Mode: Allow All
    #. System -> Boot Order: Network at TOP
#. Attempt to start the VM so VirtualBox attempts to create the network connetion
#. Shutdown bm1 when it fails
#. Shutdown VirtualBox_
#. Reboot drpfeature-test-macosx_ (required for some reason for pxe dhcp to work through VirtualBox_ on drpfeature-test-macosx_ setup.

.. _drpfeature-test-network: http://drpfeature.readthedocs.io/en/latest/drpfeatures-test-network.html
.. _drpfeature-test-macosx: http://drpfeature.readthedocs.io/en/latest/drpfeatures-test-macosx.html
.. _VirtualBox: https://www.virtualbox.org/wiki/Downloads