===========================
feature-drpux-check-install
===========================

Intent
  This feature is used to verify a fresh isolated install of drp on the local system through the drp-ux.
Success
  Passing and Failing test that verify a fresh install via the drp-ux after  

Check the iso list
------------------

Current

+-------------+------------------+-----------------------------------+------------------------+-----------------------------------------------------------+
| Purpose     | drpcli           | drp-api                           | drp-ux page url        | drp-ux list (now) ________________________________________| 
+=============+==================+===================================+========================+===========================================================+
| list of iso | drpcli iso list  | https://<endpointIP>/api/v3/isos  | #/e/<endpointIP>/isos  | <table class="ui sortable very basic very compact table"> |
+-------------+------------------+-----------------------------------+------------------------+-----------------------------------------------------------+

Suggested

+----------+------------------+-----------------------------------+------------------------+-----------------------------------+
| Purpose  | drpcli           | drp-api                           | drp-ux page url        | drp-ux list (suggest)___     _____| 
+==========+==================+===================================+========================+===================================+
| list iso | drpcli iso list  | https://<endpointIP>/api/v3/isos  | #/e/<endpointIP>/isos  | <table data-rackn-api="iso-list"> |
+----------+------------------+-----------------------------------+------------------------+-----------------------------------+

So a community user can do the following

.. literalinclude:: ../../src/features/drpux-iso-target-user.feature
  :language: gherkin
  :linenos:

So a css dev can do the following

.. literalinclude:: ../../src/features/drpux-iso-target-css.feature
  :language: gherkin
  :linenos:

So an api dev can do the following

.. literalinclude:: ../../src/features/drpux-iso-target-api.feature
  :language: gherkin
  :linenos:

So a cli dev can do the following

.. literalinclude:: ../../src/features/drpux-iso-target-cli.feature
  :language: gherkin
  :linenos:

It really is not practical keeping all the above 'in-sync' but English Language Text is really the only 'common'.  If you create mappings for the other testing levels you COULD just keep them in a yaml or json blob for CI sync.

From a UX prospective you can rackn-tag these elements into what-ever-tag-strategy you choose.  But you end up with some sort of inheritance strategy (I use pageobject).  This can be used by a theme strategy, il8n, accessablity and TEST... which is my point.  THIS COULD be passed in by the JSON blob your already using, which is why I am pushing cause basically you've got all the structural stuff to do it.

Breaking down the current UX I see 3 view panels

#. userBar - The top bar of the current UX (tied to current user auth) 
#. navBar - pageobject-navbar_ The side bar of the current UX (tied to current endpoint)
#. viewPage - pageobject-login_ The displayed info (yes I know... it can be blah blah aka dashboard)

Which is why I started creating those page object.  BUT when I created navBar I thought it was general nav... really pageobject-navbar_ is pageobject-user and pageobject-navbar better named as pageobject-endpoint.  All this naming is actually important and should support the documentation, which is why I like the idea of the mappings to check that naming.

I don't think it's worth breaking down the pageobjects into what I would suggest until we talk... figure out if this is worth the effort or not.

.. _pageobject-navbar: http://drpfeature.readthedocs.io/en/latest/pageobject-navbar.html
.. _pageobject-login: http://drpfeature.readthedocs.io/en/latest/pageobject-login.html

Testing Links

+ https://github.com/ctrees/drpfeature
+ https://192.168.1.200:8092
+ https://rackn.github.io/provision-ux/#/e/192.168.1.200:8092/isos
+ https://192.168.1.200:8092/swagger-ui/#!/Isos/listIsos

drp-api via curl::

  catmini:drpisolated msops$ curl -k -u rocketskates:r0cketsk8ts -X GET https://localhost:8092/api/v3/isos -H "Content-Type: application/json"
  ["CentOS-7-x86_64-Minimal-1708.iso","sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar","ubuntu-16.04.3-server-amd64.iso"]catmini:drpisolated msops$


Quick Start Install and Run

#. Get the quickstart_ drp-provision enpoint running locally
#. Load the isos via command line it suggests
#. Clone the repo https://github.com/ctrees/drpfeature.git (Follow the README.md_)
    #. yarn install
    #. yarn run wip
#. The "yarn run wip" should run just the drpux-iso.feature right now but you should see chrome fire up and poke stuff


.. _quickstart: http://provision.readthedocs.io/en/tip/doc/quickstart.html
.. _README.md: https://github.com/ctrees/drpfeature/blob/master/README.md

Below is the current drpux-iso.feature file.

.. literalinclude:: ../../src/features/drpux-iso.feature
  :language: gherkin
  :linenos:

The above test is run using the following command with the following output.

.. literalinclude:: feature-drpux-check-install-termout.txt
  :language: bash
  :linenos:

The below is the last gitcommit

.. literalinclude:: feature-drpux-check-install-gitcommit.txt
  :language: bash
  :linenos:

WIP
---

WIP (Work In Progress) is in REVERSE order (oldest last) so #1 should be current.

#. Update Document and commit
#. DONE - 2018-01-11 - Get basic test working for community demo
#. DONE - 2018-01-10 - Created drpfeature Issue#5 https://github.com/ctrees/drpfeature/issues/5

TODO
---- 

#. Document ReactJS and CSS selector issues
#. Screencast of working ?
#. Screencast of debugging ?
#. Verify more pageobjects
#. Define the pageobjects with the community (so I don't have to re-do)
#. Get Examples Table working

**Reference Links**

  + https://github.com/ctrees/drpfeature/
  + http://drpfeature.readthedocs.io/en/latest/feature-drpux-check-install.html
  + file:///Users/msops/Code/drpfeature/docs/build/html/feature-drpux-check-install.html
  + http://drpfeature.readthedocs.io/en/latest/help-test-drpisolated.html
  + file:///Users/msops/Code/drpfeature/docs/build/html/help-test-drpisolated.html
  + http://provision.readthedocs.io/en/tip/doc/quickstart.html
  + https://github.com/ctrees/drpfeature/issues/5
  + http://provision.readthedocs.io/en/tip/doc/cli_commands.html#rs-cli-command
  + http://provision.readthedocs.io/en/latest/doc/Swagger.html
  + http://provision.readthedocs.io/en/tip/doc/cli/drpcli_subnets_list.html
  + https://developer.mozilla.org/en-US/docs/Web/CSS/:nth-child
  + https://www.w3schools.com/cssref/css_selectors.asp
  + http://webdriver.io/guide/usage/selectors.html#Accessibility-ID
  + https://cucumber.io/docs/reference#doc-strings


Screencasts
-----------

#. Show that the drp-provision local endpoint is running.
#. tc52_ Start the test with "yarn run wip" which should ONLY run the drpux-iso.feature test
#. tc69_ Local endpoint Login
#. tc71_ Test checking isos are loaded
#. tc80_ Test of drpux-iso.feature passes 18 checks (17s)
#. tc88_ Start the full test with "yarn test"
#. Chris talks through stuff... probably can't follow line of thinking cause I'm talking to myself mostly...
#. tc181_ Test finishes up and THE END babble..

.. _tc52: https://youtu.be/Da2kyUVOTo8?t=52
.. _tc69: https://youtu.be/Da2kyUVOTo8?t=69
.. _tc71: https://youtu.be/Da2kyUVOTo8?t=71
.. _tc80: https://youtu.be/Da2kyUVOTo8?t=80
.. _tc88: https://youtu.be/Da2kyUVOTo8?t=88
.. _tc181: https://youtu.be/Da2kyUVOTo8?t=181

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/Da2kyUVOTo8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>


#. A code review of drpux-iso.feature
#. tc44_ Error: Connection reset by peer
#. tc_ package.json EXPLAINED
#. tc_ yarn wip EXPLAINED
#. tc_ src directory tree EXPLAINED
#. tc_ ./src/features/drpux-iso.feature EXPLAINED
#. tc_ tbd
#. tc_ tbd
#. tc_ tbd
#. tc_ tbd

.. _tc44: tbd
.. _tc: tbd
.. _tc: tbd
.. _tc: tbd
.. _tc: tbd
.. _tc: tbd
.. _tc: tbd


.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/Da2kyUVOTo8" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
    </div>