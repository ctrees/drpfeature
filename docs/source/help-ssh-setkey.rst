===============
help-ssh-setkey
===============

Intent
  Help to set ssh keys into machine via drp-provision as presented in the drp-set-sshkey-video_ (youtube).
Success
  Install a demo machine locally that can be accessed via ssh key (no password) as required by ansible.

Manual Steps

#. Assuming a drpfeature-test-network_ with drpfeature-test-vbox_ running the drpfeature-test-drpe_ setup.
#. Obtain or generate id_rsa.pub file ( see CentOS-Generate-ssh-key-pair_ )
#. Open RackN-Portal_ Profiles_ -> global
    #. Edit Profiles_ -> global
        #. Add PARAMETERS: access-keys ::

            { 
            "user": "ssh-rsa CAFE123 user@machine" 
            }

        #. Change string to add id_rsa.pub of user "drpops 

            { 
            "drpops": "ssh-rsa AAAABblahblahblah..9n31 drpops@drpe.drpfeature.test" 
            }

        #. Add PARAMETERS: access-ssh-root-mode
        #. Add string "without-password"
    #. Click "Save" of Profiles_ -> global Edit view.
#. The machines using the global profile grant ssh to the id_rsa.pub ssh requests.

Video Track

#. tc16_ Show RackN-Portal_ endpoint Profiles_
    #. tc16_ Show Profiles_
    #. tc30_ Show ssh login fail
    #. tc46_ Show id_rsa.pub key we want to add
#. tc60_ Open RackN-Portal_ endpoint Profiles_ -> global
    #. tc60_ Show default Profiles_ -> global
    #. tc70_ Show example ce-root-access Profiles_ -> ce-root-access
    #. tc80_ Edit Profiles_ -> global
        #. tc86_ Add PARAMETERS access-keys
            { 
            "user": "ssh-rsa CAFE123 user@machine" 
            }
        #. tc95_ BUT Change string to add id_rsa.pub of user "drpops 
            { 
            "drpops": "ssh-rsa AAAABblahblahblah..9n31 drpops@drpe.drpfeature.test" 
            }
        #. tc122_ Add PARAMETERS: access-ssh-root-mode
        #. tc129_ Add string "without-password"
    #. tc130_ Click "Save" of Profiles_ -> global Edit view.
#. tc156_ Reboot machine to test.
#. tc170_ Show RackN-Portal_ endpoint Templates_ 
#. tc175_ Show RackN-Portal_ endpoint `Boot Enviroments`_ 
#. tc294_ Show ssh login success
    
Video 

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/StQql8Xn08c" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>


.. _tc16: https://youtu.be/StQql8Xn08c?t=16
.. _tc30: https://youtu.be/StQql8Xn08c?t=30
.. _tc46: https://youtu.be/StQql8Xn08c?t=46
.. _tc60: https://youtu.be/StQql8Xn08c?t=60
.. _tc70: https://youtu.be/StQql8Xn08c?t=70
.. _tc80: https://youtu.be/StQql8Xn08c?t=80
.. _tc86: https://youtu.be/StQql8Xn08c?t=86
.. _tc95: https://youtu.be/StQql8Xn08c?t=95
.. _tc122: https://youtu.be/StQql8Xn08c?t=122
.. _tc129: https://youtu.be/StQql8Xn08c?t=129
.. _tc130: https://youtu.be/StQql8Xn08c?t=130
.. _tc156: https://youtu.be/StQql8Xn08c?t=156
.. _tc170: https://youtu.be/StQql8Xn08c?t=170
.. _tc175: https://youtu.be/StQql8Xn08c?t=175
.. _tc294: https://youtu.be/StQql8Xn08c?t=294

.. _CentOS-Generate-ssh-key-pair: https://www.centos.org/docs/5/html/5.2/Deployment_Guide/s3-openssh-rsa-keys-v2.html
.. _drp-set-sshkey-video: https://www.youtube.com/watch?v=StQql8Xn08c

.. _drpfeature-test-drpe: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-drpe.html
.. _drpfeature-test-network: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-network.html
.. _drpfeature-test-macosx: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-macosx.html
.. _drpfeature-test-vbox: http://drpfeature.readthedocs.io/en/latest/drpfeature-test-vbox.html
.. _drpfeature-test: http://drpfeature.readthedocs.io/en/latest/drpfeature-test.html
.. _drp-quickstart: http://provision.readthedocs.io/en/tip/doc/quickstart.html
.. _drp-krib-video: https://www.youtube.com/watch?v=Psm9aOWzfWk&feature=youtu.be
.. _drp-krib-document: http://provision.readthedocs.io/en/latest/doc/integrations/krib.html

.. document includes

.. include:: include-rackn-ux-menu.rst
.. include:: include-drpfeature-test-setup.rst

.. include:: include-rackn-ux-menu-show.rst

ssh hack ::

Basically, I’m not sure I can walk you through the running of a single stage to set the keys.
For example, I think you could set the machines to the ssh-access stage.
It will rerun the ssh-access task.
Assuming you’ve edited the profile to have the correct key.
then you can set the stage back to complete.
That should work, but I don’t know if you have machines in the correct state, if you have the job knowledge to verify that the ssh-access task ran, and when to deicde it was successful.


[9:37] 
Okay - here is the steps to do (thinking about them):
1. Run this: `drpcli machines list | jq -r '.[] | "\(.Name), \(.Runnable), \(.Stage), \(.CurrentTask)"'`

The machines you want to manipulate should have “<name>, true, complete, 0”

2. Edit the profile to fix the `ssh-access` to `access-keys`

3. For each machine, set the stage to `ssh-access`

4. Run the command from #1 until the stage show `ssh-access` and currentTask shows `1`

5.  Once that is done, you should be able to ssh into the boxes.

6. For each machine, set the stage to `complete`