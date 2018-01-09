import checkIfElementExists from '../lib/checkIfElementExists';
import loginPage from '../../pageobjects/login.page';
import navbarPage from '../../pageobjects/navbar.page';

/**
 * Set the value of the given input field to a new value or add a value to the
 * current element value
 * @param  {String}   username  The method to use (add or set)
 * @param  {String}   password   The value to set the element to
 */
module.exports = (username, password) => {
    /**
     * The command to perform on the browser object (addValue or setValue)
     * @type {String}
     */
    //const command = (method === 'add') ? 'addValue' : 'setValue';
    /* --- BEGIN --- THIS is what SHOULD BE DONE ---  
    const command = 'setValue';

    let checkUsernameInput = username;
    let checkPasswordInput = password;

    checkIfElementExists(loginPage.username, false, 1);
    checkIfElementExists(loginPage.password, false, 1);

    if (!username) {
        checkUsernameInput = '';
    }
    if (!password) {
        checkPasswordInput = '';
    }

    browser[command](loginPage.username, checkUsernameInput);
    browser[command](loginPage.password, checkPasswordInput);
    --- THIS is what SHOULD BE DONE --- END --- */

    /* --- BEGIN --- HACK around double id inputs -- THIS ERROR
[chrome #0-0] 1) feature-login-unknown-user6 I set "gobblygook@horseoff.com" to the inputfield "#username":
[chrome #0-0] Element with selector "#username" should exist exactly 1 time(s): expected [ Array(2) ] to have a length of 1 but got 2
[chrome #0-0] AssertionError: Element with selector "#username" should exist exactly 1 time(s): expected [ Array(2) ] to have a length of 1 but got 2

    pulling in raw steps from login.spec.js
    --- HACK around double id inputs -- THIS ERROR --- END --- */

    browser.keys('Tab');
    loginPage.username.waitForExist(3000);
    loginPage.username.waitForVisible(3000);
    loginPage.username.waitForEnabled(3000);
    browser.keys(username);
    loginPage.password.waitForExist(3000);
    loginPage.password.waitForVisible(3000);
    loginPage.password.waitForEnabled(3000);
    browser.keys('Tab');
    browser.keys(password);
    browser.keys('Tab');
    browser.keys('Tab');
    browser.keys('Enter');

};
