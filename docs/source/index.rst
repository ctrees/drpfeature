Document: drpfeature 
====================

github: https://github.com/ctrees/drpfeature/

readthedocs: http://drpfeature.readthedocs.io/en/latest/index.html

Some really good text that I forgot to type-in here.

Methods
^^^^^^^

#. Manual/Demo - Read the docs, watch YouTube
    This is where I started, DRP-YouTube_ Rob and Shayne doing stuff and reading DRP-Documents_ online.  Short-term goal is just to auto-script what Rob uses in KRIB-Demo_ video.
#. Feature/Demo - Create a Demo using the Cucumber Feature File.
    This is what this repo is attempting, but also setting the structure up to run in CI.
#. PageObject Mapping - The UI reflects functions in the drpcli, drpapi and drpux so map them.
    PageObject is a pattern for building and testing UX.  I use it to stay sane in GUI land.  This is where the RackN-DSL name mapping come into the css (I hope).
#. Regression/CI - Automated UX test to put in the CI chain.
    Basically run headless but make sure to catch changes that effect UX.
#. Learning/Docs/Transfer - Self Guided Learning and Documentation
    Ideally I could have pulled down a "Learning Tutorial" that basically included UX scritpted interaction to aid in learning both the UX and drpcli.


Guides
^^^^^^

.. toctree::
   :maxdepth: 3

   commons
   features
   pageobjects
   bugsWorkInProgress
   help
   help-test-tutorial-login

Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`

References

DRP-YouTube_
DRP-Documents_
KRIB-Demo_

.. _DRP-YouTube: https://www.youtube.com/playlist?list=PLXPBeIrpXjfj5_8Joyehwq1nnaYSPCnmw
.. _DRP-Documents: http://provision.readthedocs.io/en/latest/
.. _KRIB-Demo: https://youtu.be/OMm6Oz1NF6I?list=PLXPBeIrpXjfj5_8Joyehwq1nnaYSPCnmw


