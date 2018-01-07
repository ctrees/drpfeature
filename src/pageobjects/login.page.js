var page = require('./page');

var loginPage = Object.create(page, {
    /**
     * define elements
     */
    username: { get: function () { return $('#username'); } },
    password: { get: function () { return $('#password'); } },
    submitButton: {
      get: function () { 
          return $('input[name="signInSubmitButton"]');
    } },
    racknSupportLogoutinButton: {
      get: function () { 
          return $('#header > div:nth-child(4) > a > a');
    } },
    racknCurrentUserButton: {
      get: function () { 
          return $('#header > div:nth-child(3) > div > div > div.text'); 
    } },
    flash:    { get: function () { return $('//*[@id="loginErrorMessage"]'); } },
    getFlashHTML: { 
        get: function () {
            var textOfFlash = this.flash.getHTML();
            return textOfFlash;
    } },
    /**
     * define or overwrite page methods
     */
    open: { value: function() {
        page.open.call(this, '#/user/login');
        this.racknSupportLogoutinButton.waitForExist(3000);
        this.racknSupportLogoutinButton.click();
        this.submitButton.waitForExist(3000);
        this.username.waitForExist(3000);
        this.password.waitForExist(3000);
    } },

    submit: { value: function() {
        this.submitButton.click();
    } }
});

module.exports = loginPage;
