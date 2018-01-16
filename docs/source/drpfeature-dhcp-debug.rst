=====================
drpfeature-dhcp-debug
=====================

Intent
  This feature is used to setup and debug drp-provision dhcp.
Success
  Demonstrate dhcp debugging on an isolated network using drpcli, drp-ux and virtual-box PXE client.

Manual Steps

#. Configure drpfeature-test-network_ (mikrotek 192.168.88.1 router)
#. Install drp-provision via drp-quickstart_ in the drpfeature-test-macosx_ configuration
#. Configure drpfeature-test-vbox_ (virtual box)
#. Start drp-provision 
#. Browse to RackN-Portal_ at https://192.168.88.9:8092 and login with rocketskates r0cketsk8ts
    #. Browse to Subnets_ add or enable subnet en0 192.168.88.9/24
    #. Disable all other Subnets_
    #. Browse to Leases_
    #. Clear or validate all current dhcp leases
    #. Browse to `Boot ISOs`_
    #. Verify or load the following
        #. CentOS-7-x86_64-Minimal-1708.iso
        #. sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar
    #. Browse to `Info & Preferences`_
    #. In System Preferences set the following
        #. Default Stage -> discover
        #. Default BootEnv -> sledgehammer-wait
        #. Unknown BootEnv -> discovery
        #. Click Save
    #. Browse to Profiles_
        #. Should have some clusters
        #. k8s-cluster-Install
        #. k8s-cluster-ram
    #. Browse to `Bulk Actions`_
    #. Browse to Workflow_
#. Fire up test drpfeature-test-vbox_ vm's bm1, bm2, bm3, bm4, bm5 and bm6
#. Browse to RackN-Portal_ Machines_
    #. Verify the bm1-6 machines are Stage: discover BootEnv: sledgehammer

.. note:: Start drp-provision
    ::

        sudo ./dr-provision --static-ip=192.168.88.9 --base-root=/Users/msops/Code/drpfeature/drpisolated/drp-data --local-content="" --default-content=""

.. note:: Generate admin.conf
     ::

         ./drpcli profiles get k8s-cluster-ram param krib/cluster-admin-conf > admin.conf

.. note:: Get node info via kubectl
     ::

         kubectl --kubeconfig=admin.conf get nodes

.. note:: SETUP kubctl **PROXY** 
     ::

         kubectl --kubeconfig=admin.conf proxy 

Video Track

#. General Show UI Views
    #. tc590_ Show KRIBnode[1..8] in Machines_
    #. tc607_ Show Profiles_
    #. tc658_ Show `Bulk Actions`_
    #. tc678_ Show Workflow_ k8s-cluster-ram
#. Begin configuration to start k8s-cluster-install
    #. tc715_ Set KRIBnode[1..4] to Stages -> Mount Local Disk
    #. tc736_ Show LIVE events of above
    #. tc743_ Click on KRIBnode1 to show what that node will go through
    #. tc722_ Set KRIBnode[4..8] to Profiles -> k8s-cluster-install
    #. tc798_ Set KRIBnode[4..8] to Boot Environmens -> centos-7-install
    #. tc802_ Set KRIBnode[4..8] to Plugin Action -> powercycle
#. General Exlaining while k8s-cluster builds
    #. tc860_ Look into what k8s-cluster-ram in Profiles_ does (verbal explain)
    #. tc918_ Navigate to Stages_ select **krib-install** which has task **krib-install**
    #. tc935_ **krib-install** verbal explain of how tasks, jobs, alerts and workflow are composeable
    #. tc953_ Pull up krib-install.sh.tmpl and explain template that is executed by runner
    #. tc990_ Go look at current status of DRIBnode1 in Machines_ it is in docker-install stage of Stages_
    #. tc1079_ Show Jobs_ and bring up a job progress of a job log on a node.
    #. tc1102_ Navigate to machine via the link in the Jobs_ listing to check on machine task which is now **krib-install** 
    #. tc1104_ Navigate to task via the link in the machine view to see the log of the **krib-install** task
    #. tc1115_ Navigate to Profiles_ show k8s-cluster-ram see that node 56... has krib/cluster-master parameter so it WON the master election
    #. tc1160_ Go back to SLIDES... finish slide talk esp about dynamic tokens, configuration injection and bootstraping
    #. tc1238_ Go back to Profiles_ and refresh then pull up k8s-cluster-ram again.  You see new parameter for **cluster-join-command**
#. The **COOL NEW STUFF**
    #. tc1262_ Show **cluster-admin-conf** and use that to create admin.conf 
    #. tc1284_ Generate admin.conf
    #. tc1318_ Now go get node info via kubectl (note this is on the local system going cloud cluster)
    #. tc1337_ SETUP kubectl **PROXY** via
    #. tc1375_ **FOR THE WIN:** browse to http://localhost:8001 to get to the remote kubeadmin dashboard
#. Finish off talking about Future
    #. tc1430_ Back to SLIDES... talk about future issues...
    #. tc1484_ Node Admission verbal walk through
    #. tc1626_ Kubelet Dynamic configuration verbal walk through

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="1501" height="632" src="https://www.youtube.com/embed/Psm9aOWzfWk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>

.. _tc590: https://youtu.be/Psm9aOWzfWk?t=590
.. _tc607: https://youtu.be/Psm9aOWzfWk?t=607
.. _tc658: https://youtu.be/Psm9aOWzfWk?t=658
.. _tc678: https://youtu.be/Psm9aOWzfWk?t=678
.. _tc715: https://youtu.be/Psm9aOWzfWk?t=715
.. _tc736: https://youtu.be/Psm9aOWzfWk?t=736
.. _tc743: https://youtu.be/Psm9aOWzfWk?t=743
.. _tc722: https://youtu.be/Psm9aOWzfWk?t=772
.. _tc798: https://youtu.be/Psm9aOWzfWk?t=798
.. _tc802: https://youtu.be/Psm9aOWzfWk?t=802
.. _tc860: https://youtu.be/Psm9aOWzfWk?t=860
.. _tc918: https://youtu.be/Psm9aOWzfWk?t=918
.. _tc935: https://youtu.be/Psm9aOWzfWk?t=935
.. _tc953: https://youtu.be/Psm9aOWzfWk?t=953
.. _tc990: https://youtu.be/Psm9aOWzfWk?t=990
.. _tc1079: https://youtu.be/Psm9aOWzfWk?t=1079
.. _tc1102: https://youtu.be/Psm9aOWzfWk?t=1102
.. _tc1104: https://youtu.be/Psm9aOWzfWk?t=1104
.. _tc1115: https://youtu.be/Psm9aOWzfWk?t=1115
.. _tc1160: https://youtu.be/Psm9aOWzfWk?t=1160
.. _tc1238: https://youtu.be/Psm9aOWzfWk?t=1238
.. _tc1262: https://youtu.be/Psm9aOWzfWk?t=1262
.. _tc1284: https://youtu.be/Psm9aOWzfWk?t=1284
.. _tc1318: https://youtu.be/Psm9aOWzfWk?t=1318
.. _tc1337: https://youtu.be/Psm9aOWzfWk?t=1337
.. _tc1375: https://youtu.be/Psm9aOWzfWk?t=1375
.. _tc1430: https://youtu.be/Psm9aOWzfWk?t=1430
.. _tc1484: https://youtu.be/Psm9aOWzfWk?t=1484
.. _tc1626: https://youtu.be/Psm9aOWzfWk?t=1626

.. _`Info & Preferences`: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/system
.. _Jobs: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/jobs
.. _Stages: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/stages
.. _Workflow: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/workflow
.. _`Bulk Actions`: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/bulk
.. _Profiles: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/profiles
.. _Machines: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/machines
.. _`Boot ISOs`: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/isos
.. _Leases: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/leases
.. _Subnets: https://rackn.github.io/provision-ux/#/e/192.168.88.9:8092/subnets
.. _RackN-Portal: https://192.168.88.9:8092
.. _drpfeature-test-network: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-network.html
.. _drpfeature-test-macosx: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-macosx.html
.. _drpfeature-test-vbox: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-vbox.html
.. _drp-quickstart: http://provision.readthedocs.io/en/tip/doc/quickstart.html
.. _drp-krib-video: https://www.youtube.com/watch?v=Psm9aOWzfWk&feature=youtu.be

