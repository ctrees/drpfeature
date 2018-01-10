pageobject-login 
================

Below is common-login.rst which describes the feature and mappings.

.. literalinclude:: common-login.rst
  :language: rst
  :linenos:

Below is the provision UX login.page.js

.. literalinclude:: ../../src/pageobjects/login.page.js
  :language: javascript
  :linenos:

The above test is tested through login.spec.js

.. literalinclude:: ../../src/pospecs/login.spec.js
  :language: javascript
  :linenos:

The test can be ran isolated using the following command::

  catmini:drpfeature msops$ yarn run wdio --spec ./src/pospec/login.spec.js 

The latest visCheck images should be in drpfeature/screenshots/screen/ directory.  If you donot see the images, you need to run the test locally and rebuild the docs following::

  catmini:drpfeature msops$ yarn run test:po
  catmini:drpfeature msops$ yarn run docs
  catmini:drpfeature msops$ open file:///Users/msops/Code/drpfeature/docs/build/html/pageobject-login.html

Of course user your own local path.

Testing Results
---------------

If you do not see the images, you need to run the test locally and rebuild the docs (see above).

#. bdd-login-test-user_document_Chrome_v63_1024x768

.. image:: ../../screenshots/screen/bdd-login-test-user_document_Chrome_v63_1024x768.png

#. bdd-login-unknown-user_document_Chrome_v63_1024x768

.. image:: ../../screenshots/screen/bdd-login-unknown-user_document_Chrome_v63_1024x768.png
   
WIP
---

#. Basic login test working.
    This is the basic login test via webdriver to login a user.  I created a test@horseoff.com email address to test with to get through the aws conig? OAuth like stuff.  The major difficulty was just getting the tools up and going AND figureing out React.  Could not find much css styling to hang selectors off of and still having issues.  But for now... I'll call it good enough and start logging issues.

#. Cleanup some documentation to get the general test -> document -> validate -> documentation -> publish workflow down.

TODO
---- 

#. Better Checking, was having issues with sucking up DOM text and doing expects so making that a TODO.

#. Figure out a CSS / rackN-DSL pattern to use on the login feature and spec test.

#. Write a login.feature test that leverages login.spec.js

