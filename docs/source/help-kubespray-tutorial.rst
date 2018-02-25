========================
help-kubesparay-tutorial
========================

Intent
  Help in bringing up a kubernetes cluster via drp-provision as presented in drp-kubespray-video_ (see below) and drp-kubespray-document_ on a drpfeature-test_ setup runing the RackN-Portal_ endpoint.
Success
  Replicate drp-kubespray-video_ demo locally using drpcli, drp-ux and virtual-box vm's PXE booting bare nodes to a kubeadmin cluster.

Resources

#. kubespray-github_  github repo for kubespray
#. drp-kubespray-video_ youtube video showing uses of kubesparay Content via RackN-Portal_ `Content Packages`_
#. drp-packet-install_ youtube video showing how use drp-provision on packet.net_ servers (not used in this tutorial)
#. google-kubernetes-best-practices_ I found helpful to gain insight into kube structures

Manual Steps

#. Assuming a drpfeature-test-network_ with drpfeature-test-vbox_ running the drpfeature-test-drpe_ setup.
#. Open RackN-Portal_ `Content Packages`_
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
    #. Save and Verify Profile mycluster in Profiles_
    #. In Profiles_ click **Ansible** button (on top)
    #. Select the mycluster Profile for **Ansible Inventory Grid**
        #. Select the server nodes you want in mycluster
        #. add **etcd** and **kube master** to kubespray1
        #. add **kube node** to kubespray[2..5]
#. Show drp-kubespray-document_ and follow the commands step 24.1.4
    #. Git Clone kubespray-github_ 
    #. Pull in invenotry.py from drp-inventory.py-source-file_ (rob shows link)
        #. Fix pointed to the wrong endpoint issue
        #. Look at what endpoint we are pointed to `./drpcli info get`
        #. Set endpoint `export RS_ENDPOINT=https://192.168.88.3:8092`
    #. Test `RS_PROFILE=mycluster ./inventory.py | jq` command
    #. Test Ansible via ping `ansible all -i inventory.py -m ping`
    #. Deploy the k8s cluster with kubespray `ansible-playbook -i inventory.py cluster.yml`
#. check the kubernetes api on master node https://192.168.88.100:6443 (kube changeme)

Video Track

#. tc20_ Show kubespray-github_ repo
#. tc55_ Show packet.net_ servers and refer to drp-packet-install_ video
#. tc80_ Show RackN-Portal_ endpoint Machines_
#. tc97_ Navigate to `Content Packages`_
    #. tc106_ Find kubespray Content
    #. tc110_ Transfer kubespray Content to Endpoint Content
#. tc120_ Navigate to Profiles_
    #. tc123_ The following locked Profiles should have been added
        #. etcd
        #. k8s-cluster
        #. k8s-deploy
        #. kube-master
        #. kube-node
    #. tc170_ Clone the k8s-deploy Profile in Profiles_
    #. tc219_ Rename and Edit the Profile for mycluster
    #. tc242_ Save and Verify Profile mycluster in Profiles_
    #. tc253_ In Profiles_ click **Ansible** button (on top)
    #. tc260_ Select the mycluster Profile for **Ansible Inventory Grid**
        #. tc303_ Select the server nodes you want in mycluster
        #. tc303_ add **etcd** and **kube master** to kubespray1
        #. tc310_ add **kube node** to kubespray[2..5]
#. tc333_ Show drp-kubespray-document_ and follow the commands step 24.1.4
    #. tc373_ Git Clone kubespray-github_ 
    #. tc373_ Pull in invenotry.py from drp-inventory.py-source-file_ (rob shows link)
        #. tc387_ Fix pointed to the wrong endpoint issue
        #. tc433_ Look at what endpoint we are pointed to `./drpcli info get`
        #. tc473_ Set endpoint `export RS_ENDPOINT=https://147.75.77.95:8092`
    #. tc509_ Test `RS_PROFILE=mycluster ./inventory.py | jq` command
    #. tc600_ Test Ansible via ping `ansible all -i inventory.py -m ping`
    #. tc641_ Deploy the k8s cluster with kubespray `ansible-playbook -i inventory.py cluster.yml`
#. tc771_ check the kubernetes api on master node https://147.75.106.45:6443 (kube changeme)


Video 

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/b5himGQ1Zew" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>

.. Video time code (tc) links

.. _tc20: https://youtu.be/b5himGQ1Zew?t=20
.. _tc55: https://youtu.be/b5himGQ1Zew?t=55
.. _tc80: https://youtu.be/b5himGQ1Zew?t=80
.. _tc97: https://youtu.be/b5himGQ1Zew?t=97
.. _tc106: https://youtu.be/b5himGQ1Zew?t=106
.. _tc110: https://youtu.be/b5himGQ1Zew?t=110
.. _tc120: https://youtu.be/b5himGQ1Zew?t=120
.. _tc123: https://youtu.be/b5himGQ1Zew?t=123
.. _tc170: https://youtu.be/b5himGQ1Zew?t=170
.. _tc219: https://youtu.be/b5himGQ1Zew?t=219
.. _tc242: https://youtu.be/b5himGQ1Zew?t=242
.. _tc253: https://youtu.be/b5himGQ1Zew?t=253
.. _tc260: https://youtu.be/b5himGQ1Zew?t=260
.. _tc303: https://youtu.be/b5himGQ1Zew?t=303
.. _tc310: https://youtu.be/b5himGQ1Zew?t=310
.. _tc333: https://youtu.be/b5himGQ1Zew?t=333
.. _tc373: https://youtu.be/b5himGQ1Zew?t=373
.. _tc387: https://youtu.be/b5himGQ1Zew?t=387
.. _tc433: https://youtu.be/b5himGQ1Zew?t=433
.. _tc473: https://youtu.be/b5himGQ1Zew?t=473
.. _tc509: https://youtu.be/b5himGQ1Zew?t=509
.. _tc600: https://youtu.be/b5himGQ1Zew?t=600
.. _tc641: https://youtu.be/b5himGQ1Zew?t=641
.. _tc771: https://youtu.be/b5himGQ1Zew?t=771

.. document includes

.. include:: include-rackn-ux-menu.rst
.. include:: include-drpfeature-test-setup.rst

.. Reference Links

.. _drp-inventory.py-source-file: https://github.com/digitalrebar/provision/blob/master/integrations/ansible/inventory.py
.. _packet.net: https://www.packet.net/
.. _drp-packet-install: https://www.youtube.com/watch?v=pHp6cHF11IM
.. _drp-kubespray-video: https://www.youtube.com/watch?v=b5himGQ1Zew
.. _drp-kubespray-document: http://provision.readthedocs.io/en/latest/doc/integrations/ansible.html?highlight=kubespray

.. _google-kubernetes-best-practices: https://www.youtube.com/watch?v=BznjDNxp4Hs
.. _kubespray-github: https://github.com/kubernetes-incubator/kubespray


.. Key in global profile
    access-keys: {
    "drpops": "ssh-rsa AAA...U9n31 drpops@drpe.drpfeature.test"
    }
    access-ssh-root-mode: "without-password"