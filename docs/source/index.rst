Document: drpfeature 
====================

github: https://github.com/ctrees/drpfeature/

issues: https://github.com/ctrees/drpfeature/issues

release: https://github.com/ctrees/drpfeature/projects/1

readthedocs: http://drpfeature.readthedocs.io/en/latest/index.html

drpfeature is Feature Testing for `Digital Rebar Provision`_ 

Some really good text that I forgot to type-in here.

Methods
^^^^^^^

#. Manual/Traditional Ops Context
    `Digital Rebar Provision`_ read the docs, watch DRP-videos_ and use DRP-cli_ . This is where I started, DRP-YouTube_ Rob and Shayne doing stuff and reading DRP-Documents_ online.  Short-term goal is just to auto-script what Rob uses in KRIB-Demo_ video.
#. Feature/Documentation/Training Context
    Create a Demo using the `Cucumber Feature File`_ using marketing and documentation natural language.  This is what this repo is attempting, but also setting the structure up to run in CI.
#. PageObject Mapping/CSS WebDev/Frontend testing
    The UI reflects functions in the drp-cli, drp-api and drp-ux so map them.  PageObject is a pattern for building and testing UX.  I use it to stay sane in GUI land.  This is where the RackN-DSL name mapping come into the css (I hope).
#. REST-API/Documentation/testing
    The REST-API servers as backend for the DRP-UX and reflects the core DRP-cli commands, so it should be the core of functional evaluation.  I intend to use something like `Postmanlab's newman`_ and tie those same test files into feature execution.
#. CLI/Documentation/testing
    From what I can tell, most the curren provision tesing is clang.  I think it's worth capturing some standard BASH things and using `Bash Automated Testing System - BATS`_ or something else like Ansible_ to capture and drive drp-cli in CI. 
#. Regression/CI - Automated UX test to put in the CI chain.
    Basically run headless but make sure to catch changes that effect UX so they can be run on Travis_ or Jenkins_
#. Learning/Docs/Transfer - Self Guided Learning and Documentation
    Ideally I could have pulled down a "Learning Tutorial" that basically included UX scritpted interaction to aid in learning both the UX and drpcli.

.. _`Digital Rebar Provision`: http://provision.readthedocs.io/en/latest/
.. _DRP-videos: https://www.youtube.com/channel/UCr3bBtP-pMsDQ5c0IDjt_LQ/videos
.. _DRP-cli: http://provision.readthedocs.io/en/latest/doc/cli_commands.html#rs-cli-command
.. _`Cucumber Feature File`: https://github.com/cucumber/cucumber/wiki/Feature-Introduction
.. _`Postmanlab's newman`: https://github.com/postmanlabs/newman
.. _`Bash Automated Testing System - BATS`: https://github.com/sstephenson/bats
.. _Ansible: https://www.ansible.com/
.. _Travis: https://travis-ci.org/
.. _Jenkins: https://jenkins-ci.org/

Guides
^^^^^^

.. toctree::
   :maxdepth: 3

   commons
   features
   pageobjects
   bugsWorkInProgress
   drpfeature-test
   help
   help-krib-tutorial
   help-kubespray-tutorial
   help-test-tutorial-login
   help-test-drpisolated
   help-doc-github-issue
   help-doc-github-release
   help-debug-login
   help-ssh-setkey
   help-drpcli-reservations

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


