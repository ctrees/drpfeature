====================================
drpfeature-test-drpe-ansible-blender
====================================

Intent
  Add blender render node via ansible-playbook.
Success
  RackN-Portal_ setup that uses inventory.py to run **ansible all -i inventory.py -m ping**

Manual Steps

#. Assuming a drpfeature-test-network_ with drpfeature-test-vbox_ running the drpfeature-test-drpe_ setup.
#. Assuming the drp3-Clone-post4machineHPEpxeboot vm configuration.
#. Assuming drpfeature-test-drpe-ansible_ setup
#. Start drpe vm ( see drpfeature-test-drpe_ )
#. ssh drpops@192.168.88.3 ( good4installs# )
    #. Start drp-provision on drpe::

        [drpops@drpe ~]$ cd drpisolated/
        [drpops@drpe drpisolated]$ sudo ./dr-provision --static-ip=192.168.88.3 --base-root=/home/drpops/drpisolated/drp-data --local-content="" --default-content=""

#. Open RackN-Portal_ `Content Packages`_ We need to load something ansible to test
    #. Click "Browse For More Content"
    #. Find kubespray and click the + icon to add this content to endpoint
    #. View your drpfeature-test-drpe_ Endpoint (hamburger -> Endpoint..)
    #. Click `Content Packages`_ again you should see kubespray
    #. Verify kubespray is in your endpoint, if not "Transfer" it so that it displays in the Endpoint Content column
#. Navigate to Profiles_ 
    #. The following locked Profiles should have been added
        #. etcd
        #. k8s-cluster
        #. k8s-deploy
        #. kube-master
        #. kube-node
    #. Clone the k8s-deploy Profile in Profiles_
    #. Rename and Edit the Profile for mycluster
    #. Save (Click Add button) and Verify Profile mycluster in Profiles_
    #. In Profiles_ click **Ansible** button (on top)
    #. Select the mycluster Profile for **Ansible Inventory Grid**
        #. Select the server nodes you want in mycluster
        #. add **etcd** and **kube master** to a machine
        #. add **kube node** to others
#. Fire up four bare metal machines on drpfeature-test-hpeC7000_
    #. Browse to drpfeature-test-hpeC7000_
    #. Login with drpops ( good4installs# )
    #. Should see 4 blades (or how ever many are in at the time)
    #. Click the blade image and it takes you to the blade View
    #. Click Boot Options (confirm it is booting from local disk)
    #. Click Virtual Devices (to control power / boot)
#. Reference the drp-kubespray-document_ and follow the commands step 24.1.4
    #. ssh drpops@192.168.88.3 ( good4installs# )
    #. SKIP THIS - Git Clone kubespray-github_ (SKIP... we are just testing the inventory.py file)
    #. Create directory `mkdir testansible` and `cd testansible`
    #. Pull in inventory.py from drp-inventory.py-source-file_ (rob shows link)
    #. Make executable `chmod +x inventory.py`
    #. Verify local environment endpoint is set.
    #. Look at what endpoint we are pointed to `./drpcli info get`
    #. Set endpoint `export RS_ENDPOINT=https://192.168.88.3:8092`
    #. Set profile `export RS_PROFILE=mycluster`
    #. Test `./inventory.py | jq` command
    #. Test Ansible via ping `ansible all -i inventory.py -m ping`

Video Track

#. tc_ Make Video and Show stuff at some point

Video 

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <span> No Video Yet </span>
    </div>


.. Video time code (tc) links

.. _tc: https://youtu.be/

.. document includes

.. include:: include-rackn-ux-menu.rst
.. include:: include-drpfeature-test-setup.rst

.. _drp-inventory.py-source-file: https://github.com/digitalrebar/provision/blob/master/integrations/ansible/inventory.py

.. _drp-kubespray-video: https://www.youtube.com/watch?v=b5himGQ1Zew
.. _drp-kubespray-document: http://provision.readthedocs.io/en/latest/doc/integrations/ansible.html?highlight=kubespray

.. _google-kubernetes-best-practices: https://www.youtube.com/watch?v=BznjDNxp4Hs
.. _kubespray-github: https://github.com/kubernetes-incubator/kubespray
