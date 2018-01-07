help-test-tutorial-login
========================

This is intended as video tutorial testing workflow walkthrough.

Agenda
------

#. TLTR - Setup, Clone and Run.

#. WTF - Navigate the Results.

#. FLAMEON - Complain about something and fix it (suggested workflow).

#. HACK - Tweak, break, hack and fix till your tired (cause it's what we do).

#. BDFL - Benevolent Dictator For Life or Force other to bend to your will through code, use, documentation and basically being the smartest person in the room (even if your Taed).

TLTR
----

Setup, Clone and Run it already.... ::

    catmini:Demo msops$ git clone https://github.com/ctrees/drpfeature.git
    catmini:Demo msops$ cd drpfeature/
    catmini:drpfeature msops$ yarn install
    catmini:drpfeature msops$ yarn run test
    catmini:drpfeature msops$ yarn run docs

WTF
---

OK... what just happened explained.  

So that's the run we are going to look at in detail now.

#. Clone    - $ git clone https://github.com/ctrees/drpfeature.git && cd drpfeature/
#. Install  - $ yarn install
#. Test     - $ yarn run test
#. Document - $ yarn run docs

Full terminal output for your geek inspection::

    catmini:Demo msops$ git clone https://github.com/ctrees/drpfeature.git
    Cloning into 'drpfeature'...
    remote: Counting objects: 147, done.
    remote: Compressing objects: 100% (126/126), done.
    remote: Total 147 (delta 21), reused 140 (delta 17), pack-reused 0
    Receiving objects: 100% (147/147), 137.98 KiB | 2.76 MiB/s, done.
    Resolving deltas: 100% (21/21), done.
    catmini:Demo msops$ cd drpfeature/
    catmini:drpfeature msops$ yarn install
    yarn install v1.3.2
    [1/4] 🔍  Resolving packages...
    [2/4] 🚚  Fetching packages...
    [3/4] 🔗  Linking dependencies...
    warning " > chai-webdriver@1.2.0" has incorrect peer dependency "chai@>= 1 < 4".
    warning " > chai-webdriverio@0.4.3" has incorrect peer dependency "chai@~4.0.1".
    warning " > babel-jest@22.0.4" has unmet peer dependency "babel-core@^6.0.0 || ^7.0.0-0".
    [4/4] 📃  Building fresh packages...
    ✨  Done in 20.90s.
    catmini:drpfeature msops$ yarn run test
    yarn run v1.3.2
    $ yarn run test:fcheck; yarn run test:po
    $ yarn run wdio --spec ./src/features/githubSearch.feature
    $ /Users/msops/Demo/drpfeature/node_modules/.bin/wdio --spec ./src/features/githubSearch.feature
    ------------------------------------------------------------------
    [chrome #0-0] Session ID: 2f05b4650c4ebc047cc11102f40ce9de
    [chrome #0-0] Spec: /Users/msops/Demo/drpfeature/src/features/githubSearch.feature
    [chrome #0-0] Running: chrome
    [chrome #0-0]
    [chrome #0-0] Github test
    [chrome #0-0]
    [chrome #0-0]     open URL
    [chrome #0-0]       ✓ I open the url "https://github.com/ctrees/drpfeature"
    [chrome #0-0]       ✓ I expect that the url is "https://github.com/ctrees/drpfeature"
    [chrome #0-0]       ✓ I expect that the title is "GitHub - ctrees/drpfeature: Digital Rebar Provision UX Feature Testing Automation"
    [chrome #0-0]
    [chrome #0-0]
    [chrome #0-0] 3 passing (4s)
    [chrome #0-0]

    $ DEBUG=false yarn run wdio wdio.PageObjectTest.conf.js
    $ /Users/msops/Demo/drpfeature/node_modules/.bin/wdio wdio.PageObjectTest.conf.js
    ------------------------------------------------------------------
    [chrome #0-0] Session ID: f2b03e485ca7a87851b3a2094e9ffa87
    [chrome #0-0] Spec: /Users/msops/Demo/drpfeature/src/pospecs/login.spec.js
    [chrome #0-0] Running: chrome
    [chrome #0-0]
    [chrome #0-0] drp-ux auth form
    [chrome #0-0]   ✓ should-deny-access-with-wrong-creds
    [chrome #0-0]   ✓ should-allow-access-with-correct-creds
    [chrome #0-0]
    [chrome #0-0]
    [chrome #0-0] 2 passing (14s)
    [chrome #0-0]

    ✨  Done in 31.70s.
    catmini:drpfeature msops$ yarn run docs
    yarn run v1.3.2
    $ cd docs && make html && cd ..
    Running Sphinx v1.6.5
    making output directory...
    loading pickled environment... not yet created
    building [mo]: targets for 0 po files that are out of date
    building [html]: targets for 10 source files that are out of date
    updating environment: 10 added, 0 changed, 0 removed
    reading sources... [100%] pageobjects                                                                       
    looking for now-outdated files... none found
    pickling environment... done
    checking consistency... done
    preparing documents... done
    writing output... [100%] pageobjects                                                                        
    generating indices... genindex
    writing additional pages... search
    copying images... [ 50%] ../../screenshots/screen/should-allow-access-with-correct-creds_document_Chrome_v63copying images... [100%] ../../screenshots/screen/should-deny-access-with-wrong-creds_document_Chrome_v63_1024x768.png
    copying static files... done
    copying extra files... done
    dumping search index in English (code: en) ... done
    dumping object inventory... done
    build succeeded.

    Build finished. The HTML pages are in build/html.
    ✨  Done in 2.04s.
    catmini:drpfeature msops$ 

AND we get screen shots of the test if you missed the flash of the browser working.

**NOTE: THESE IMAGES ONLY SHOW** if you build the docs locally.

#. should-deny-access-with-wrong-creds

    .. image:: ../../screenshots/screen/should-deny-access-with-wrong-creds_document_Chrome_v63_1024x768.png
       :width: 400

#. should-allow-access-with-correct-creds

    .. image:: ../../screenshots/screen/should-allow-access-with-correct-creds_document_Chrome_v63_1024x768.png
       :width: 400

FLAMEON
-------

OK... now let's **add value** as I like to say, or just Bchn... but it's improving thing in my reality.

#. Inspecting the test.
    #. Specfically I started with this git commit of login.spec.js_ and login.page.js_ (links are to commit pre-changes we make later).
    #. tbd
    #. tbd
#. Notice that test is not really checking anything other than a **Screen Compare**
    #. tbd
    #. tbd
#. Well... HECK... I can **HACK** something better than this ;-)
    #. tbd
    #. tbd
#. What next... HACK see below.

HACK
----

The fun part till you get frustrated with humans and there pretty little tools too.

BDFL
----

Becoming the Benevolent Dictator For Life seems fun, but takes lots of human and artificial minions _BUT_ it makes life easier when well trained.


login tutorial Video
====================

Part 1
------

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/yBVuIWMREWQ" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>


References

login.spec.js_ and login.page.js_

.. _login.spec.js: https://github.com/ctrees/drpfeature/blob/e9647a41ff09ebe27699a626f5b89fd7fd2c732b/src/pospecs/login.spec.js
.. _login.page.js: https://github.com/ctrees/drpfeature/blob/e9647a41ff09ebe27699a626f5b89fd7fd2c732b/src/pageobjects/login.page.js