===========================
feature-drpux-check-install
===========================

Intent
  This feature is used to verify a fresh isolated install of drp on the local system through the drp-ux.

  + https://github.com/ctrees/drpfeature/
  + http://drpfeature.readthedocs.io/en/latest/feature-drpx-check-install.html
  + file:///Users/msops/Code/drpfeature/docs/build/html/feature-drpx-check-install.html
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

  Testing Links

  + https://github.com/ctrees/drpfeature
  + https://192.168.1.200:8092
  + https://rackn.github.io/provision-ux/#/e/192.168.1.200:8092/isos
  + https://192.168.1.200:8092/swagger-ui/#!/Isos/listIsos

  drp-api via curl::

    catmini:drpisolated msops$ curl -k -u rocketskates:r0cketsk8ts -X GET https://localhost:8092/api/v3/isos -H "Content-Type: application/json"
    ["CentOS-7-x86_64-Minimal-1708.iso","sledgehammer-f5ffd3ed10ba403ffff40c3621f1e31ada0c7e15.tar","ubuntu-16.04.3-server-amd64.iso"]catmini:drpisolated msops$

Success
  Passing and Failing test that verify a fresh install via the drp-ux after  

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