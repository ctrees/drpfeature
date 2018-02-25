
==============================
help-test-tutorial-login-debug
==============================

This is video was done after I foo-bar a working test and got lost.  In my effort to get back to what I had working, I figured out a cleaner way to explain how the feature DSL could talk to the CSS/spec DSL.

#. tc98_ IN the BEGINNING... I had something WORKING... BUT I IMPROVED ;-)
#. tc114_ I explain the Working feature steps
#. tc254_ Explain my concept of what amazoncognito.com is doing DOM wise (picking up a state)
#. tc291_ I explain the double ReactJS identical elements that messes up normal testing selectors
#. tc459_ Start to Follow from Feature file to Webdriver...
    #. tc459_ login.feature Scenario STEP -> GIVEN
    #. tc463_ given.js -> "I am an anonymous user at the RackN-Portal" -> loginPage (which is our objectpage) given.js imports loginPage from login.page.js
    #. tc519_ login.page.js -> requires page.js and inherits to build loginPage
#. tc679_ Now trace down the real BUG in "I attempt RackN-Login with ".." and password ".."
#. tc771_ NOW at tracing back the BUG I introduced
#. tc840_ THE BUG was SIMPLE... I had a require with the wrong directory PATH
#. tc1067_ Slowly work through the tracing the BUG (FOR FUTURE REFERNCE navagating the js TESTING structures) plus it helped me clean up some code
#. tc1495_ BACK to where I was BEFORE I foo-bar'd
#. tc1629_ Now attempting to hack around the issue with react (multiple identical elements) which foo-bars the testing selector pattern
#. tc1696_ Show how test screenshots works
#. I keep working the feature at this point on... attempting to navagate around the multiple idential react
#. tc1907_ Decide to check in my work... end up talking about all the changes I made 

    
.. _tc98: https://youtu.be/Iq5K2g3qGhU?t=98
.. _tc114: https://youtu.be/Iq5K2g3qGhU?t=144
.. _tc254: https://youtu.be/Iq5K2g3qGhU?t=254
.. _tc291: https://youtu.be/Iq5K2g3qGhU?t=291
.. _tc459: https://youtu.be/Iq5K2g3qGhU?t=459
.. _tc463: https://youtu.be/Iq5K2g3qGhU?t=464
.. _tc519: https://youtu.be/Iq5K2g3qGhU?t=519
.. _tc679: https://youtu.be/Iq5K2g3qGhU?t=679
.. _tc771: https://youtu.be/Iq5K2g3qGhU?t=771
.. _tc840: https://youtu.be/Iq5K2g3qGhU?t=840
.. _tc1067: https://youtu.be/Iq5K2g3qGhU?t=1067
.. _tc1495: https://youtu.be/Iq5K2g3qGhU?t=1495
.. _tc1629: https://youtu.be/Iq5K2g3qGhU?t=1629
.. _tc1696: https://youtu.be/Iq5K2g3qGhU?t=1696
.. _tc1907: https://youtu.be/Iq5K2g3qGhU?t=1907


.. raw:: html

    <div style="position: relative; padding-bottom: 5.25%; height: 0; overflow: hidden; max-width: 100%; height: auto;">
    <iframe width="1366" height="695" src="https://www.youtube.com/embed/Iq5K2g3qGhU" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
    </div>