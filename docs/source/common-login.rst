common-login
============

**Intent**
  This login is used to access UX elements in the RackN portal login process and to preform automated UX login testing.

**Success**
  Passing and Failing test that can detect successful and failed RackN UX portal user login.

**Related Information**
  #. feature help location: docs/source/feature-login.rst
  #. feature file location: src/features/login.features
  #. pageobject help location: (this file) docs/source/pageobject-login.rst
  #. spec test file location: src/spec/login.spec.js
  #. pageobject file location: src/pageojects/login.page.js
  #. visual result file 1: screenshots/screen/login-<testname1>_document_Chrome_v63_1024x768.png
  #. visual result file 2: screenshots/screen/login-<testname2>_document_Chrome_v63_1024x768.png

**Related Links**

.. toctree::
   :maxdepth: 2

   feature-login
   pageobject-login
   help-test-tutorial-login
   help-debug-login

The above test is run using the following command with the following output.

.. literalinclude:: common-login-termout.txt
  :language: bash
  :linenos:

If you do not see the images, you need to run the test locally and rebuild the docs (see above).

#. bdd-login-test-user_document_Chrome_v63_1024x768

.. image:: ../../screenshots/screen/bdd-login-test-user_document_Chrome_v63_1024x768.png

#. bdd-login-unknown-user_document_Chrome_v63_1024x768

.. image:: ../../screenshots/screen/bdd-login-unknown-user_document_Chrome_v63_1024x768.png

`youtube (17:21) drpfeature login common tests 2018 01 09 15 16 55`_

#. tc27_ Show local of http://drpfeature.readthedocs.io/en/latest/feature-login.html
#. tc73_ Run login.feature test ONLY to verify it is passing::

    yarn run wdio --spec ./src/features/login.features

#. tc116_ Run ALL the tests to verify I didn't break other tests (which I did)::

    yarn run test

#. tc116_ WOOPS... I left 'verbose' on in the wdio.PageObjectTest.conf.js
#. tc207_ WE FOUND an ERROR... yup login.spec.js
#. tc307_ Begin tracing down Error in login.spec.js
#. tc393_ THE FIX - move code that I had in the loginPage.open call into login.spec.js
#. tc580_ Seemed to work... run again to check
#. tc664_ OK... it's working... so NOW lets update the docs and commit the changes.
#. tc741_ Create common-login-termout.txt to dump the results to the document.


#. next

.. _`youtube (17:21) drpfeature login common tests 2018 01 09 15 16 55`: https://youtu.be/OdpHsmyaVXg
.. _tc27: https://youtu.be/OdpHsmyaVXg?t=27
.. _tc73: https://youtu.be/OdpHsmyaVXg?t=73
.. _tc116: https://youtu.be/OdpHsmyaVXg?t=116
.. _tc187: https://youtu.be/OdpHsmyaVXg?t=187
.. _tc207: https://youtu.be/OdpHsmyaVXg?t=207
.. _tc307: https://youtu.be/OdpHsmyaVXg?t=307
.. _tc393: https://youtu.be/OdpHsmyaVXg?t=393
.. _tc580: https://youtu.be/OdpHsmyaVXg?t=580
.. _tc664: https://youtu.be/OdpHsmyaVXg?t=664
.. _tc741: https://youtu.be/OdpHsmyaVXg?t=741

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/OdpHsmyaVXg" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

**Related - Read The Docs - Links**
  #. common-login_ Common resources for login feature
  #. feature-login_ Documentation for login feature
  #. pageobject-login_ Documentation for login pageobject
  #. help-test-tutorial-login_ Tutorial on developing, debuging and using login testing.

.. _common-login: http://drpfeature.readthedocs.io/en/latest/common-login.html
.. _feature-login: http://drpfeature.readthedocs.io/en/latest/feature-login.html
.. _pageobject-login: http://drpfeature.readthedocs.io/en/latest/pageobject-login.html
.. _help-test-tutorial-login: http://drpfeature.readthedocs.io/en/latest/help-test-tutorial-login.html

