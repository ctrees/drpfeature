Help
====

Ping ctrees_at_mailserviceslc_dot_com

==========
References
==========

 + github drpfeature_
 + ReadTheDocs drpfeature-docs_
 + Docs created via Sphinx_
 + rst-cheatsheet_ 
 + pip-install_
 + drpfeature_ is based on cucumber-boilerplate_ feature test for drp_ UX portal
 + drp_ is a work fork of drp-forksource_
 + cucumber-boilerplate_ is a work fork of cucumber-boilerplate-forksource_

=================
Build ReadTheDocs
=================

To edit and update the readthedocs::

 $ cd ~/Code
 $ git clone https://github.com/ctrees/drpfeature
 $ cd drpfeature/docs
 $ make html
 $ open build/html/index.html
 $ vi source/help.rst
 $ make html
 $ open build/html/index.html
 (verify changes)
 $ make clean
 $ cd ~/Code/drpfeature
 $ git add *
 $ git commit -m "Update documents"
 $ git push
 (wait some min for webhooks to hit)
 $ open http://drpfeature.readthedocs.io/en/latest/
 (inspect changes)

==============
Sphinx Install
==============

To install Sphinx via pip ( pip-install_ ) to make documentation::

 $ python --version
 Python 2.7.10
 $ python get-pip.py
 $ pip --version
 pip 9.0.1 from /Library/Python/2.7/site-packages (python 2.7)
 $ sudo pip install --ignore-installed Sphinx

==========================
cucumber webdriver Install
==========================

Quick Start::

 $ node --version
 v8.9.3
 $ cd ~/Code
 $ git clone https://github.com/ctrees/drpfeature.git
 $ cd drpfeature
 $ yarn install
 $ yarn run local-webserver
 $ yarn run test


.. _drpfeature: https://github.com/ctrees/drpfeature
.. _drpfeature-docs: http://drpfeature.readthedocs.io/en/latest/
.. _Sphinx: http://www.sphinx-doc.org/en/stable/tutorial.html
.. _rst-cheatsheet: https://github.com/ralsina/rst-cheatsheet/blob/master/rst-cheatsheet.rst
.. _pip-install: https://pip.pypa.io/en/stable/installing/
.. _drp: https://github.com/ctrees/provision
.. _drp-forksource: https://github.com/digitalrebar/provision
.. _cucumber-boilerplate: https://github.com/ctrees/cucumber-boilerplate
.. _cucumber-boilerplate-forksource: https://github.com/webdriverio/cucumber-boilerplate
