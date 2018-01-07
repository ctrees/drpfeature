function Page () {
}

Page.prototype.open = function (path) {
    browser.url(path);
};

Page.prototype.visCheck = function (visFailMessage) {
    // checkDocument is a visual regression test check
    // http://webdriver.io/guide/services/visual-regression.html#Usage
    var results = browser.checkDocument();
    results.forEach(function (result) {
        expect(result.isWithinMisMatchTolerance).to.equal(true, visFailMessage);
    });
};

module.exports = new Page();
