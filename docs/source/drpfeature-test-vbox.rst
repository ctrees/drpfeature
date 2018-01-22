=======================
drpfeature-test-vbox
=======================

Intent
  This is the drpfeature-test vbox setup for testing drp-provision.
Success
  vbox setup for PXE boot nodes on an isolated network so broadcast messages are easy to monitor.

Manual Steps - VirtualBox_ Install

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

Manual Steps - drpe.drpfeature.test Install

#. Start VirtualBox_
#. Configure drpe.drpfeature.test
    #. New -> Name: drpe - Type: Linux - OS: RedHat 64-bit
    #. Memory -> 1024 MB
    #. HD -> 8 GB
    #. CPU -> 2
    #. Network -> Attached to: Bridged Adaptor - Name: en0: Ethernet - Promiscuous Mode: Allow All
        #. NOTE: MAC Address: 080027F10BD9
        #. Help on VirtualBoxBridgedNetwork_
    #. System -> Boot Order: Floppy -> Optical -> Hard Disk
    #. Storage -> CD -> CentOS-7-x86_64-Minimal-1708.isolated
        #. Get the iso CentOS7-Everything-iso_
#. Boot and Install
    #. Language: English - English (United States) <Continue>
    #. NETWORK & HOSTNAME: 
        #. Host name: drpe.feature.test <Apply>
        #. Ethernet (enp0s3) <Configure>
            #. General:
                #. Automatically connect to this network **Checked**
                #. All users may connect to this network **Checked**
            #. Ethernet:
                #. Device: enp03s (should be default)
                #. MTU: automatic
                #. Wake on LAN: default
                #. Link negotiation: ignore
            #. IPv4 Settings:
                #. Method: Manual
                #. Addresses:
                    #. Address: 192.168.88.3
                    #. Netmask: 24
                    #. Gateway: 192.168.88.1
                #. DNS serveres: 192.168.88.1, 8.8.8.8
                #. Search domains: drpfeature.test
                #. Require IPv4 addressing: **Checked**
            #. IPv6 Settings:
                #. Method: Ignore
            #. **CLICK** SAVE
        #. **CLICK** Done
    #. DateTime: Americas/Chicago <Done> (do NETWORK config first to pickup NTP servers)
    #. SOFTWARE SELECTION:
        #. Infrastructure servere
        #. Security Tools
        #. **CLICK** Done
    #. INSTALLATION DESTINATION:
        #. **CLICK** ATV VBOX HARDRIVE
        #. **CLICK** Done
    #. KDUMP
        #. **UnCheck** Enable KDUMP (to disable)
        #. **CLICK** Done
    #. SECURITY POLICY
        #. **CLICK** OFF - Apply security policy:
        #. **CLICK** Done
    #. ROOT PASSWORD:
        #. good4ops$
        #. **CLICK** Done
    #. CREATE USER:
        #. Full Name: drops
        #. User name: drops
        #. **Check** Make this user administrator
        #. **Check** Require password to use this account
        #. good4installs#
        #. **CLICK** Done
    #. **CLICK** Finish INSTALLATION
    #. WHEN PROMPTED: **CLICK** Reboot
#. INSTALL SSH on drpe.drpfeature.test
    #. login as root
    #. yum install openssh openssh-server openssh-clients openssl-libs
    #. cp /etc/ssh/sshd_config /etc/ssh/sshd_config.orig
    #. systemctl restart sshd.service
#. TEST ssh access to drpe.drpfeature.test static IP: 192.168.88.3
    #. catmini:drpfeature msops$ ssh drpops@192.168.88.3
#. INSTALL drp-provision isolated via drp-quick-install_ (modified)
    #. ssh drpops@192.168.88.3
    #. mkdir drpisolated
    #. cd drpisolated
    #. curl -fsSL get.rebar.digital/stable | bash -s -- install --force --isolated 
#. START drp-provision see drp-provision-ServerArchitecture_ for information
    #. ssh drpops@192.168.88.3 (I want it running in it's own term so I can see stdout)
    #. cd drpisolated
    #. sudo ./dr-provision --static-ip=192.168.88.3 --base-root=/home/drpops/drpisolated/drp-data --local-content="" --default-content=""
#. TEST drpe
    #. Browse to https://192.168.88.3:8092 the RackN-Portal_ see drp-install-running-the-server_ for help
    #. Confirm RackN-Portal_ (should be getting a login with defaults 
    #. Login with defaults 
        #. username: rocketskates
        #. password: r0cketsk8ts
    #. Confirm RackN-Portal_ endpoint 192.168.88.3:8092
#. Load iso images
    #. ssh drpops@192.168.88.3
    #. cd drpisolated
    #. ./drpcli bootenvs uploadiso sledgehammer
    #. ./drpcli bootenvs uploadiso centos-7-install
#. TEST iso
    #. In RackN-Portal_ you should see green check on ISO
    #. Browse to `Boot ISOs`_ you should see the iso's you loaded above.
#. CREATE clone image drpe-CLONE-fresh-no-subnet_
    #. STOP drp-provision
    #. sudo shutdown now 
    #. VirtualBox
        #. Wait till drpe stops
        #. Right-click drpe -> Clone ( name: drpe-CLONE-fresh-no-subnet_ )
    #. On host (macosx) /Users/msops/VirtualBox\ VMs/
        #. Right-click drpe-CLONE-fresh-nosubnet (5.28GB) and Compress (zip down to 4GB)
    #. Wait for compress to finish... this is a good point to save while debugging network configs
#. Create a subnet via drpcli see drp-install-subnet_ for help
    #. Start drpe VM and drp-provision
        #. Start drpe virtualbox vm
        #. ssh drpops@192.168.88.3 (I want it running in it's own term so I can see stdout)
        #. cd drpisolated
        #. sudo ./dr-provision --static-ip=192.168.88.3 --base-root=/home/drpops/drpisolated/drp-data --local-content="" --default-content=""
    #. Stop firewalld
        #. ssh drpops@192.168.88.3 
        #. [drpops@drpe drpisolated]$ sudo systemctl stop firewalld
    #. Create a new subnet for iPXE
        #. ssh drpops@192.168.88.3 (I want it running in it's own term so I can see stdout)
        #. cd drpisolated
        #. vi drpfeature-subnet-config.json ::

            {
            "Name": "drpfeature-test-subnet",
            "Subnet": "192.168.88.0/24",
            "ActiveStart": "192.168.88.100",
            "ActiveEnd": "192.168.88.199",
            "NextServer": "192.168.88.3",
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
                { "Code": 3, "Value": "192.168.88.1", "Description": "Default Gateway" },
                { "Code": 6, "Value": "8.8.8.8", "Description": "DNS Servers" },
                { "Code": 15, "Value": "drpfeature.test", "Description": "Domain Name" },
                { "Code": 28, "Value": "192.168.88.255", "Description": "Broadcast Address" },
                { "Code": 67, "Value": "lpxelinux.0", "Description": "Boot file name" }
            ]
            }

        #. ./drpcli subnets create - < drpfeature-subnet-config.json
        #. Create subnet via drpcli done
    #. Verify subnet drpfeature-test-subnet
        #. ./drpcli subnets list
        #. Should return drpfeature-subnet-config.json string
    #. Create subnet Verify check complete
#. Verify drpfeature-test-subnet
    #. In RackN-Portal_ you should see green check on Subnets_
    #. Browse to Subnets_ you should see the subnet you configured above.
#. Create a machine to iPXE boot see drp-install-machine_ for help
    #. Set BootEnvs::

        [drpops@drpe drpisolated]$ ./drpcli prefs set unknownBootEnv discovery defaultBootEnv sledgehammer defaultStage discover

    #. Verify BootEnvs browse to `Info & Preferences`_ and see above in **System Preferences**
    #. Setup PXE Boot on a vm (see above bm1)
        #. Start bm1
        #. bm1 should boot into discover then sledgehammer
        #. Verify bm1 discovery browse Machines_
        #. Login to bm1 console: root - rebar1 to verify sledgehammer is on bm1
        #. xxx-tbd-xxx
    #. Obtain you machine ID::

        [drpops@drpe drpisolated]$ ./drpcli machines list | jq '.[].Uuid'

    #. Set the BootEnv to centos-7-install replace <UUID> with your machines ID from the above command::

        [drpops@drpe drpisolated]$ ./drpcli machines bootenv "4678729e-5147-43f6-a569-93b7668b8a40" centos-7-install

    #. Reboot bm1 - it should now kick off a BootEnv install as you specified above.
    #. Verify bm1 access::

        TODO - Put the bm1 access std out from above

#. Cleanup
    #. Install jq::

        [drpops@drpe drpisolated]$ sudo yum install jq
    
    #. Turn off firewalld::

        [drpops@drpe drpisolated]$ sudo systemctl stop firewalld

    #. **DISABLE** firewalld::

        [drpops@drpe drpisolated]$ sudo systemctl disable firewalld
        Removed symlink /etc/systemd/system/multi-user.target.wants/firewalld.service.
        Removed symlink /etc/systemd/system/dbus-org.fedoraproject.FirewallD1.service.
        [drpops@drpe drpisolated]$ 

#. CREATE clone image drpe-CLONE-drpfeature-test-network_
    #. STOP drp-provision
    #. sudo shutdown now 
    #. VirtualBox
        #. Wait till drpe stops
        #. Right-click drpe -> Clone ( name: drpe-CLONE-drpfeature-test-network_ )
    #. On host (macosx) /Users/msops/VirtualBox\ VMs/
        #. Right-click drpe-CLONE-drpfeature-test-network (5.28GB) and Compress (zip down to 4GB)
    #. Wait for compress to finish... this is a good point to save while debugging network configs
#. I **THINK** THIS IS Done... nope ks still stuck

#. Debugging vm loading

http://192.168.88.3:8091/machines/db1dcb0f-d0b6-4afb-9da9-e62b62a68e24/compute.ks

uuid - b47e9a44-e78b-468b-a756-cbc59356f340

THE KS http://192.168.88.3:8091/machines/b47e9a44-e78b-468b-a756-cbc59356f340/compute.ks ::

        # DigitalRebar Provision Centos-7 (and related distros) kickstart

        install
        url --url http://192.168.88.3:8091/centos-7/install
        # Add support for our local proxy.
        repo --name="CentOS"  --baseurl=http://192.168.88.3:8091/centos-7/install  --cost=100
        # key --skip
        # Disable geolocation for language and timezone
        # Currently broken by https://bugzilla.redhat.com/show_bug.cgi?id=1111717
        # geoloc 0
        timezone --utc UTC
        lang en_US.UTF-8
        keyboard us
        # rebar
        rootpw --iscrypted $6$drprocksdrprocks$upAIK9ynEEdFmaxJ5j0QRvwmIu2ruJa1A1XB7GZjrnYYXXyNr4qF9FttxMda2j.cmh.TSiLgn4B/7z0iSHkDC1
        firewall --disabled
        authconfig --enableshadow --enablemd5
        selinux --disabled

        bootloader --location=mbr  --append="rhgb quiet"
        zerombr

        clearpart --all 
        part /boot --fstype ext4 --size=512 
        part /boot/efi --fstype vfat --size=512 
        part swap --recommended
        part pv.6 --size=1 --grow 
        volgroup dac-16-2d-af-e0-20 --pesize=32768 pv.6
        logvol / --fstype ext4 --name=lv_root --vgname=dac-16-2d-af-e0-20 --size=1 --grow --maxsize=10240
        text
        reboot

        %packages
        @core
        trousers
        fipscheck
        device-mapper-multipath
        openssh
        curl.x86_64
        efibootmgr
        tar
        %end

        %post

        exec > /root/post-install.log 2>&1
        set -x
        export PS4='${BASH_SOURCE}@${LINENO}(${FUNCNAME[0]}): '

        #!/usr/bin/env bash

        # Make sure we have a drpcli somewhere
        if [[ ! -e /usr/local/bin/drpcli ]] ; then
        ProvURL="http://192.168.88.3:8091"
        (mkdir -p /usr/local/bin; cd /usr/local/bin; curl -s -f -L -o drpcli "$ProvURL/files/drpcli.amd64.linux"; chmod 755 drpcli)
        fi

        # Get a Machine token that we can use for drpcli actions
        export RS_TOKEN="7mTWEkHls60dBJmk3vdB6sfxp_rRlf03DAm-VufI70L-_gyV2sj7vZLNc0sM81SGVLy40IVIpLg25jkw4WSmSG2li36zlPsERMSWfqYosf_zkqkZB1ey-e2doFqlJYaPkbB30T9T62P7hiHTbwXlatqDAN4b4IrgUPov001G5UwyLCguDtbVPfHu2XtcP047Oepi5DV_vWIojboEpyfNvjtQaONEtbnVFJTgv0KGBJeHHUlrFYuXj2Uurs1tseQ6CXFoqdEDWlR1tqPjcHrgvd0gVmndG8ir8yTjN6nZq-qKQfT1HkFJtpnpE9BmfHH4OOY3V_CjZH9pcr9wgrlzx1h2DjYIwO-bsgTRD3Eg5ovRYEq_miCBbzGrMDd-hEmOFXhiKHtt5cLP0ojUdt9fRABwo28Mg3rwxhwMq5Jp3E4a4sUDAIsCO4-T1ziI_r3UNk_xwYfSoCaxcYZrB3luB3HKByExvESnQGbxyG01fZuxPVttGxgmA8Ytd8ugE4c-Lgvw4jPge-4E13nLnUDE3jCaCER1DTdlwAng0ew4649P3MO3PtlJcVVMfYJVhQHPr1kt811rfudgpxPh7xXZLplAT721pO5kjZZQPF9E0KUjgoIKmzUfOVlujEbeRVm8KG2ih1yEmbH864aLTQXEmii8sHEwnk6UeNwyS9Rxd3yOIdp-Pzljd28Oh4JT-Nkdo3tQ_ng7SrBiXbdzSo9aBxqGu3TtGGHTmShsdeX5xdxXqtQ8b9KV7MI5-OUOeHMwE3E7Faa4vQW_TknzOir9WYsib9my-UXV1X7Cm_lGWgSevT_TUXzCb-UniE5VyEG3pffwWn0nXEHno3pvILvJIfcypS0upZ_0XwitpH-3og_eRiBIS7U6cQfb6hEjJJe58CXSFbkIeORde1eREy43Jj8Vchga7eh_we9Tr4_3jw7y4IQ8gOVxlPW47sCWs_Jsl-Qel5tj2Cain2nUmetk-58KTiZP9RYwJT5j_b6m0ViB5PCPIm4oZEu64EG4KXeqo8_b8jjFwrPnmIdXTdJBgcZ-YYvO78dssc998tYlddCRG18VUFqlISDd66ds-x6G3wDL4vdlcM1crYTBkVvwEO_UPLue79ltCZtQRJEEprPGpHTev_bcQcwn8_r5FxrzZJktNInommgqFjux1-_2FJg9n8wJeDYP3FgGFeQ7LUYsjWtvTJlpGx0ueQ0Mk6Hcb4tjMJ-kbRJmXORrNyIPTLhEULy5bB2u6x8-FEHeaxTGBGlR_-R4yqN8Yd7otjRJB0cYo-Lkgk-QHj7w3VsZ4F_b2Ncxxc4nzhwWTictnkXi416s2ZaUAVp4H6ZKrYojG-iKj5ybw9gzhivU4V3uoduBr_5I5ZewndqC-Sg-3s7II7bGTMMsnnoo5gvIq57OGWr2mNxrc1hlcA3JR0_Rt-3Qfm44DGAyxdJj3Jm3vUaxlNWAMKxzY9dWTtJEw-x9CIVo3SRCaH5df6CCazN5Z4HH1GOdE8sc_QpQDUkUI59KggTdd5zXF4Go1cvTHtqpJ9WiakjJAp77iw_solePByIHCKyBVqNO5MkFd53iIpQsaHOdsvtH9UbZE2jBxGRPnpyQ-ubm4TKm8_Alhxk09Sgpz0eL3S0XyPoi3ob9fiAney39e3WC1vWhHtaY_hNRXhLQGb2s-CyxguQGtQQag8HmCNw0v_zUOQyjxR10kKy_tkbRdIBtnT1dJqRnWX9JohiA7Bo9aqeEPIEcFFk9bOcFSqlEMweKbXx00BBFrgl1A9SsT2z8DEWKkTNuf4NP5cm_6FrOEHBJwpBxBsABU4-_BlIzvi-6W_74ytlbxt5_9_bkhozdMuncHBvdE5NDz0vMDZqN2puuMVx_LuFPWQilP1_U-ybBNwKd1p5Jko-fZxbA5pc5wVv-1whgPWG8GBsOGKVPQea98H0h1Xs56w7nH93dzd41tFdrLS77n5KJ_74oW1d3y4ZSkNwmwT_4nN4WMnHixCNkR3glguCVco_nk_HgYNgQJoFKQJtPOzd0bLDpstB_ZEkGZj9NfTxPKT0XIu7xlRNAU-8eT8HKGyEQOh5YWdxPrdDCTzAlWqUM3tGJfJF6JNd9f8cJi8bD7yt9lUDAomIo0RkkkJoq_fA6avjBqBEfLg_9x1wSdTvsnvf3yuRBifcRrbcNCvzrsijvSunOlZ9TeCXcHD5wYqFgXv3KDHIUcNU01Z4E0axhIrs-SNX-0sFwBN-alE42Fb9rgPDPPY97jOsklsCrWXRWnWcYtqUm2tgY6HazXAXj0hlAnA=="

        # Get API endpoint
        export RS_ENDPOINT="https://192.168.88.3:8092"

        # One day Reset the workflow chain here as well

        # Reset the current task list and mark the machine runnable.
        /usr/local/bin/drpcli machines update "b47e9a44-e78b-468b-a756-cbc59356f340" '{ "Runnable": true, "CurrentTask": -1 }'


        #!/usr/bin/env bash

        # Make sure we have a drpcli somewhere
        ProvURL="http://192.168.88.3:8091"
        (mkdir -p /usr/local/bin; cd /usr/local/bin; curl -s -f -L -o drpcli "$ProvURL/files/drpcli.amd64.linux"; chmod 755 drpcli)

        # Get a Machine token that we can use for drpcli actions
        export RS_TOKEN="ULDmy6uvRUptudoAO2tsWAU8vaREqnLDn_kXbn9VfP_7-MCEvp5MQrqCyO0SIpeh8fG8AFHlqj1LdkItOESrzf-M_uDrZzkeK5MbjSicd4bbyt0as6G9Eiz85wBC1e8m1I9kbG2JM6yCKVWw_FQtXtpzAS1WdzMgyUuo-gkl-lwnRIxMCJfOfwGggkuRS08-bc3WlYr_Iue0q0VUyKAOlq-gprYmYb1cWyZp2TF4AFvdj9sSVonVjTAhy0FbZxsr0J64splTzg7b75bGemDs4IQ0xYa-vMwCN7fr6URVf9gdcsJjZ0NFfo8GajL9qh55vKMtDj8dAS7Nleb8XVBgQ4RbLL9SYTJhDrYDM9kr5aXle_d5Wd1NFkcoTKJlX65KrxZDVyyQTq5AsUMxC5JAq8FMQjjQsiIXJukuLUh19WgG_vtW3-2rzet2PTVKoWCAyRpFvqOt6ClUT5Ro2_qtap_ny85wccSza0px_2_Zz3vAI1g2NRjUF2j7F37Ksal9TAiL9vP5Z02_LEbGDBR-z2F6-AKYxNT3wQZ3rTpHAwyjJLTyTd4fxY7rRiJbXgbZNXPA6i8QOWAAT-oMzirao40gHqb6494uiP8jd3OgGV0rNcbM8MWy38gh3prJFjcOuwC4dov2codPl-ZKHz-Wi7qcG3Hhle2QPWYSn2PxLLSZPJhLzYybmOybTuFdMLv4PRFupzA2gAvMsDov_IF1D3GsESNSEaQ3BKRVjqPavAKzPA1Lcp0OEy0PDG9aM_DLsUOSFVXfp728q3ehGmPei3sIeXxDDkFA9v5hZjhASLSSYMqPdCI-DKoeyeI0w5kG68mkIwAcXpIj9NsbrvLfGkOb3eRI-QdP-CfaNz9sxdF5gn43zLkiQaKU2tpcqLLOXX6PIcIDGYW1dYqZK76vtu_70U5hjaml4IEcF96enMqQ80aBgOOembmAMnNooNokl1Mc-o5_VGqn9N_YBcgYQSapdjgV3-vxVWTkyrDrfED7qL-JeUF6nqMouAfkJAGKL2rwVBUkRvAiDbhc18QOua6ROkLoZLgLsq4UKqjIiuNwKsy_ZiBYUH5G1p8QsbiOdsu9RZm9m8CydACBM7f_Q66tj1MhNKocM3BCO4DEwGyeYhkb_7PlzCX4xoLrlMFZXBpSPelXYVEMjpjx3ioGuZE4Z5RQ2izj-E2TbBef1eIqEpGo4mBFFkVcn3k6938LLyda9vrjopS4ozpCgkTwcYJjIpZMel6kCLz3nUNivcrKjrHrMP0z8HO1jNeLl2jM0_c63AXVCu96eH6pTo50IEOMf2Z43izxSIX0S05GrjG_j9k4EuWnzOCx0GO5OZ6qGTrBaXWfZ-oXyyZKXY3AURe-s5hBmFn69eZYSgIy6pmPJqg0hnR9Rn7-4jBqDTvjha5WFZRWvoxOdT4Ct0aI5P0oOWZEzUx0WuX-N5eNkTs1k_UqfeMtW_UnjAmQzX7zZIzZlRkKesSCveJ5Ne1-UKAZmVfAia-g36JGkF28yVFL8HW1K473z5bRiibcIuXS_kys275dtUg9dl4bl9eO16zp-WY8wTgx2xUhIVPMigV2v3kvylp-w7HyuKZ_nvtn6a-Rqgs06tnsH7SZimM9POu785KDC_Jkx8m9Vud5HeRwSkEwuzWf8XyjCCNcwtGaukRye9dMVkTLIHK9aPwp7U_riXz7bi_oSEBtvjEobwUwAQHxjKo72MII2yZPG_rrGZNOWfNOLgxdVmkWjYozvzNgwAlhv7sPgECjugqPCMLH60U6dda38v9SRUf7cRNkK5sFWhd476w_lQ0A5I2XkEbqBWzCOJki0QrDMibI4gd14XxGpkEElv_F-BhaDCHL7QlXyh0a6FbfQGn56mT6ZSUKvg0PP5tLJR2M-MemLvj2G0mDEgkxVzEPlmBPZ8O6Rr7UgOdBy1QB7ezxS7N3cRAHbdsHYm5v2WmJXsNXiQ6DTTJFCjoemLL_udOzimfMUFxJQFehde3UaBc_wBL3c1wPwBhqQwep78mBN6CYtWDUw1FeEJNrglf2nOKTkja-BXXvqij-Lo0RrS5V9ZBitByobY3IofxFGDKtMWm80jXT5qqyeX779u2WmHBO3xTau3pK3rBQzjD-sBkA_rtMvcDvuZj6Vd5Bz1u4vkSm7mbzN1iQgLVC5me_heI5n5Ux2Lpkai2Mh-HAI4Q9HKs23DuCxCIuQhyTOTqFKk-Xpr_URD-wIZJDmOXOG3gMeT1cfESR-i16BaSMP4UKo2d7jP42qpljyxA8rlO-qhxAbzMBqA9Ofw=="

        # Get API endpoint
        export RS_ENDPOINT="https://192.168.88.3:8092"


        # Create a temp workspace
        temp_dir="$(mktemp -d)"
        cd "$temp_dir"

        /usr/local/bin/drpcli machines processjobs "b47e9a44-e78b-468b-a756-cbc59356f340"

        rm -rf "$temp_dir"



        sync
        %end

.. _drp-provision-ServerArchitecture: http://provision.readthedocs.io/en/latest/doc/server.html
.. _drp-quick-install: http://provision.readthedocs.io/en/latest/doc/quickstart.html#install
.. _drp-install-running-the-server: http://provision.readthedocs.io/en/latest/doc/install.html#running-the-server
.. _drp-install-subnet: http://provision.readthedocs.io/en/latest/doc/quickstart.html?highlight=subnet#configure-a-subnet
.. _drp-install-machine: http://provision.readthedocs.io/en/latest/doc/quickstart.html?highlight=subnet#install-your-first-machine
.. _CentOS7-Everything-iso: http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Everything-1708.iso
.. _VirtualBox: https://www.virtualbox.org/wiki/Downloads
.. _VirtualBoxBridgedNetwork: https://www.virtualbox.org/manual/ch06.html#network_bridged

.. _git-ssh-key-generation: https://git-scm.com/book/en/v2/Git-on-the-Server-Generating-Your-SSH-Public-Key
.. _drp-provision-documents: https://github.com/digitalrebar/provision
.. _drp-video-DHCPNetwork: https://www.youtube.com/watch?v=5YWMlYYuu-s&feature=youtu.be
.. _drp-video-MacOSX: https://www.youtube.com/watch?v=5YWMlYYuu-s&feature=youtu.be

.. _drpfeature-get-ks-from-drpe: http://192.168.88.3:8091/machines/c49349cb-d3c6-4168-9fcd-9cadc2b8ce01/compute.ks

.. _drp-slack-community: https://rackn.slack.com/messages/C02L9P26Q/

.. _drpe-CLONE-fresh-no-subnet: https://drpfeature.2cld.net/images/drpe-CLONE-fresh-no-subnet/
.. _drpe-CLONE-drpfeature-test-network: https://drpfeature.2cld.net/images/drpe-CLONE-drpfeature-test-network/

.. document includes

.. include:: include-rackn-ux-menu.rst
.. include:: include-drpfeature-test-setup.rst
