feature-githubSearch
====================

**Intent**
  This feature is mainly used as an enviroment check just to make sure the overall cucumber / webdriver / selenium / browser setup is functioning.

**Success**
  Passing and Failing test that detect expected text on this repo on https://github.com/ctrees/drpfeature/.

**Related Information**
  #. feature file location src/features/githubSearch.features

Below is the current githubSearch.feature file.

.. literalinclude:: ../../src/features/githubSearch.feature
  :language: gherkin
  :linenos:

The above test is run using the following command.

.. literalinclude:: feature-githubSearch-termout.txt
  :language: bash
  :linenos:

Currently this test only checks https://github.com/ctrees/drpfeature html title.  GitHub search and 'fake login' Scenarios are commented out.
