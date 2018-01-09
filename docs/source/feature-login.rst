==================
feature-login
==================

Below is common-login_ which describes the feature and mappings.

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

#. Basic login test working.
    This is the basic login test via webdriver to login a user.  I created a test@horseoff.com email address to test with to get through the aws conig? OAuth like stuff.  The major difficulty was just getting the tools up and going AND figureing out React.  Could not find much css styling to hang selectors off of and still having issues.  But for now... I'll call it good enough and start logging issues.

#. Cleanup Documents and create an issue for the Feature Login

TODO
---- 

#. Get working as well as login.spec.js.


.. _common-login: http://drpfeature.readthedocs.io/en/latest/common-login.html

.. 
    ----- DELETE THE FOLLOWING WHEN DONE -----
    //-cat RENAME Patterns
    //- <taskname> : The name of the test task of the tutorial expample: "login"
    //- <github-commithash-reference> : The commithash of the reference files
    //- <help-test-tutorial-<taskname>> : The tutorial template pointer
    //- <pageobject-<taskname>.rst> : Associated pageobject document
    //- <<taskname>-page.js> : Associated pageobject
    //- <<taskname>-spec.js> : Associated mocha bdd test
    //- <feature-<taskname>.rst> : Associated Feature document
    //- <<taskname>.feature> : Associated Feature test
    //- <terminal-output-of-task-run> : Terminal output dump of test run for future.
    //- <mocho-bdd-spec-test-name-1> : Spec test number 1
    //- <mocho-bdd-spec-test-name-1-image.png> : Spec visual test result image 1
    //- <mocho-bdd-spec-test-name-n> : Spec test number n
    //- <mocho-bdd-spec-test-name-n-image.png> : Spec visual test result image n
    //- <feature-test-name-1> : feature test name 1
    //- <feature-test-name-1-image.png> : feature visual test result image 1
    //- <feature-test-name-n> : feature test name 1
    //- <feature-test-name-n-image.png> : feature visual test result image n
    //- <taskname-youtube-pt1> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9 cat3x3)
    //- <taskname-youtube-pt2> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9)
    //- <taskname-youtube-pt3> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9)
    //- <taskname-youtube-pt4> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9)
    //- <taskname-youtube-pt5> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9)
    //- <taskname-youtube-pt6> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9)
    //- <taskname-youtube-pt7> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9)
    //- <taskname-youtube-pt8> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9)
    //- <taskname-youtube-pt9> : Task youtube video pt1 (I attempt to keep them under 9 parts... aka cat9)
