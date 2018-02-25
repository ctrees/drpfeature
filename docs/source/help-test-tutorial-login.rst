help-test-tutorial-login
========================

This is intended as video tutorial testing workflow walkthrough.

Agenda

#. TLTR - Setup, Clone and Run.

#. WTF - Navigate the Results.

#. FLAMEON - Complain about something and fix it (suggested workflow).

#. HACK - Tweak, break, hack and fix till your tired (cause it's what we do).

#. BDFL - Benevolent Dictator For Life or Force other to bend to your will through code, use, documentation and basically being the smartest person in the room (even if your Taed).

TLTR

Setup, Clone and Run it already.... ::

    catmini:Demo msops$ git clone https://github.com/ctrees/drpfeature.git
    catmini:Demo msops$ cd drpfeature/
    catmini:drpfeature msops$ yarn install
    catmini:drpfeature msops$ yarn run test
    catmini:drpfeature msops$ yarn run docs

WTF

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

#. bdd-login-test-user_document_Chrome_v63_1024x768

    .. image:: ../../screenshots/screen/bdd-login-test-user_document_Chrome_v63_1024x768.png
       :width: 400

#. bdd-login-unknown-user_document_Chrome_v63_1024x768

    .. image:: ../../screenshots/screen/bdd-login-unknown-user_document_Chrome_v63_1024x768.png
       :width: 400

FLAMEON

OK... now let's **add value** as I like to say, or just Bchn... but it's improving thing in my reality.

#. Inspecting the test.
    #. Specfically I started with this git commit of login.spec.js_ and login.page.js_ (links are to commit pre-changes we make later).
    #. See Part 3
#. Notice that test is not really checking anything other than a **Screen Compare**
    #. See Part 6
    #. See Part 7
#. Well... HECK... I can **HACK** something better than this ;-)
    #. See Part 7
    #. See Part 8
#. What next... HACK see below.

HACK

The fun part till you get frustrated with humans and pretty little tools too.

See Part 8.

BDFL

Becoming the Benevolent Dictator For Life seems fun, but takes lots of human and artificial minions _BUT_ it makes life easier when well trained.

See Part 9

login tutorial Vide0

+ Part 1 - TLTR

#. Show http://drpfeature.readthedocs.io/en/latest/index.html
#. Explain Read the Docs Index 
#. Show https://gihub.com/ctrees/drpfeature
#. Clone the https://gihub.com/ctrees/drpfeature.git repo
#. yarn install
#. yarn run test (does 2 test a feature and a spec)
#. yarn run docs
#. open docs/build/html/index.html
#. open docs/build/html/pageobject-login.html

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/yBVuIWMREWQ" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

+ Part 2 - WTF - Docs and Workflow

#. Show new http://drpfeature.readthedocs.io/en/latest/help-test-tutorial-login.html
#. Show local docs file:///Users/msops/Demo/drpfeature/docs/build/html/pageobject-login.html with screenshots
#. Start to talk through login.page.js
#. Talk about over-all Methods in http://drpfeature.readthedocs.io/en/latest/index.html
#. Talk about Feature File aka cucumber aka gerkin http://drpfeature.readthedocs.io/en/latest/feature-githubSearch.html
#. Talk about testing workflow
#. Talk about testing results we got in terminal
#. Talk about the 2 UX test levels Feature for Natural Language, Spec for CSS code mappings
#. Talk about association of various maps to a common Domain Language

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/kdxyK7bDMZA?list=PLz24SCapAVurPUfZmRDaJcR6TaHpVXCab" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

+ Part 3 - WTF / FLAMEON - Workflow and Debug

#. Talk about CI regression
#. Talk about Learning/Docs/Transfer Automation Tutorial ?
#. Back to running tests "yarn run test" and watch again
#. Talk about tools and bug problems I was running into
#. FLAMEON - Find what I want to complain about
#. Talk about pageobject-login http://drpfeature.readthedocs.io/en/latest/pageobject-login.html
#. Talk about login.page.js
#. Bitch about getting access to DOM
#. Stop and pick up the debug session

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/lNTYViS4RV8?list=PLz24SCapAVurPUfZmRDaJcR6TaHpVXCab" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

+ Part 4 - WTF - Overview of project stuff

#. Go back to http://drpfeature.readthedocs.io/en/latest/pageobject-login.html
#. Go pull up login.page.js
#. Get distracted and explain the project Tree
#. Explain node_modules and yarn
#. Explain sceenshots - testing reference screenshots
#. Explain yarn.lock
#. Explain wdio.PageObjectTest.conf.js
#. Explain package.json
#. Explain .gitignore, .eslintrc.yaml, .editorconfig, .babelrc

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/uIBSTxSbWjw?list=PLz24SCapAVurPUfZmRDaJcR6TaHpVXCab" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

+ Part 5 - WTF - Files and Patterns

#. Explain src directory... the source testing files
#. feature, steps and support are for cucumber
#. pageobject and pospecs are for mocha
#. Explain pageobjects - page.js
#. Explain page inheritance pattern
#. Explain that I want to map all the lookup tables to a common domain language
#. Examine pageobject/login.page.js
#. Explain how login.page.js suck up objects AND define page selectors for unique objects
#. woops... end of time

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/oEU0rwS1Wt0?list=PLz24SCapAVurPUfZmRDaJcR6TaHpVXCab" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

+ Part 6 - WTF / FLAMEON - source files, steps, testing tools

#. Explain pospecs/login.spec.js
#. explain chai asserts (which are missing right now)
#. explain user test@horseoff.com (test account)
#. Explain the test steps
#. bitch about no css handles and expand...
#. explain webdriver.io webdriver w3 spec selenium json-wire-protocal
#. walk through the code more
#. bitch and jump around...
#. add "browser.debug()" and go away

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/3jc77GaVK-E?list=PLz24SCapAVurPUfZmRDaJcR6TaHpVXCab" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

+ Part 7 - FLAMEON / HACK - Discover DOM, Reactjs

#. run "yarn run test:po"
#. attempt to explain while it's running... hit "browser.debug();"
#. Show how I get into console and figure out a selector
#. Show why reactjs give me fits as I browse the DOM
#. Figure out the selector I should use "#header > div:nth-child(3) > div > div > div.text"
#. Show that I do have that selector in login.page.js 
#. bitch about how reactjs can mess this up... 
#. put code in to test for asssert
#. Run Test... woops... too late next time

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/7iJXEneCyK4?list=PLz24SCapAVurPUfZmRDaJcR6TaHpVXCab" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

+ Part 8 - HACK - Break, Debug, FIX and improve

#. take browser.debug(); out so it does not stop
#. run test "yarn test:po" woops I messed up (didn't save)
#. control-c and ... wait it passes ?..
#. run "yarn test:po" test again... talk about expectations
#. go look at local docs file:///Users/msops/Code/drpfeature/docs/build/html/pageobject-login.html
#. make it FAIL ... so we can see it break
#. run "yarn test:po" test again and yak about expections
#. fails... and explain failure
#. why didn't we get screen fail... oh well...

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/iydkuN1gWVU?list=PLz24SCapAVurPUfZmRDaJcR6TaHpVXCab" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

+ Part 9 - HACK / BDFL - cleanup, make run, document for fame

#. Part 9 ends this... even if I want to go on...
#. fix what we broke...
#. woops... test still broke... duh error validemail vs "validemail"
#. Test PASS... do it again cause you know...
#. Lets update a doc
#. compile docs run "yarn docs"
#. check update docs file:///Users/msops/Code/drpfeature/docs/build/html/pageobject-login.html
#. yak about Pull Requests... 
#. talk about http://drpfeature.readthedocs.io/en/latest/help-test-tutorial-login.html

.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="854" height="480" src="https://www.youtube.com/embed/mXTpOh3HQvM?list=PLz24SCapAVurPUfZmRDaJcR6TaHpVXCab" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>

References

login.spec.js_
login.page.js_

.. _login.spec.js: https://github.com/ctrees/drpfeature/blob/e9647a41ff09ebe27699a626f5b89fd7fd2c732b/src/pospecs/login.spec.js
.. _login.page.js: https://github.com/ctrees/drpfeature/blob/e9647a41ff09ebe27699a626f5b89fd7fd2c732b/src/pageobjects/login.page.js