==================
feature-login
==================

Below is common-login which describes the feature and mappings.

.. literalinclude:: common-login.rst
  :language: rst
  :linenos:

Below is the current login.feature file.

.. literalinclude:: ../../src/features/login.feature
  :language: gherkin
  :linenos:

The above test is run using the following command with the following output.

.. literalinclude:: feature-login-termout.txt
  :language: bash
  :linenos:

Currently this test only checks https://github.com/ctrees/drpfeature html title.  GitHub search and 'fake login' Scenarios are commented out.

WIP
---

WIP (Work In Progress) is in REVERSE order (oldest last) so #1 should be current.

#. 2018-01-09 - Docs and screencast details of login feature problems and workflow

#. 2018-01-09 - Basic login test working  https://github.com/ctrees/drpfeature/commit/ddebd56fda05d0712059ca4b0d344a94769121a0
    This is the basic login test via webdriver to login a user.  I created a test@horseoff.com email address to test with to get through the aws conig? OAuth like stuff.  The major difficulty was just getting the tools up and going AND figureing out React.  Could not find much css styling to hang selectors off of and still having issues.  But for now... I'll call it good enough and start logging issues.

TODO
---- 
