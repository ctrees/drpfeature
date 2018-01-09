var expect = require('chai').expect;
var LoginPage = require('../pageobjects/login.page');
var NavbarPageObject = require('../pageobjects/navbar.page');

//- TODO: BEGIN-NOTE
//- Should come from some private/map/dsl thing but for now
const validEmail = 'test@horseoff.com';
const validPass = 'GoodUser1';
const loginText = 'RackN Portal Login'
const logoutText = 'Logout & Support';
//- END-NOTE

describe('drp-ux auth form', function () {
    
    it('bdd-login-unknown-user', function () {
        LoginPage.open();
        LoginPage.racknSupportLogoutinButton.waitForExist(3000);
        LoginPage.racknSupportLogoutinButton.click();
        LoginPage.submitButton.waitForExist(3000);
        LoginPage.username.waitForExist(3000);
        LoginPage.password.waitForExist(3000);
        LoginPage.username.waitForExist(3000);
        LoginPage.username.waitForVisible(3000);
        browser.keys('Tab');
        browser.keys('gobblygook@horseoff.com');
        browser.keys('Tab');
        browser.keys('BadPass');
        browser.keys('Tab');
        browser.keys('Tab');
        browser.keys('Enter');
        //- Visual check is stored in drpfeature/screeshots/screen 
        LoginPage.visCheck('visCheck: wrong creds fail')
    });
    
    it('bdd-login-test-user', function () {
        LoginPage.open();
        LoginPage.racknSupportLogoutinButton.waitForExist(3000);
        LoginPage.racknSupportLogoutinButton.click();
        LoginPage.submitButton.waitForExist(3000);
        LoginPage.username.waitForExist(3000);
        LoginPage.password.waitForExist(3000); 
        browser.keys('Tab');
        LoginPage.username.waitForExist(3000);
        LoginPage.username.waitForVisible(3000);
        LoginPage.username.waitForEnabled(3000);
        browser.keys(validEmail);
        LoginPage.password.waitForExist(3000);
        LoginPage.password.waitForVisible(3000);
        LoginPage.password.waitForEnabled(3000);
        browser.keys('Tab');
        browser.keys(validPass);
        browser.keys('Tab');
        browser.keys('Tab');
        browser.keys('Enter');
        //- Visual check is stored in drpfeature/screeshots/screen 
        NavbarPageObject.visCheck('visCheck: Valid login Check Fail')
    });
});
