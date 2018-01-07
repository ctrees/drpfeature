var page = require('./page');

var navbarPage = Object.create(page, {
    racknSupportLogoutinButton: {
      get: function () { 
          return $('#header > div:nth-child(4) > a > a');
        } 
    },
    racknCurrentUserButton: {
      get: function () { 
          return $('#header > div:nth-child(3) > div > div > div.text'); 
        }
    },
    racknSystemManagementButton: {
        get: function () { 
            return $('i[title="System & User Management"]'); 
          }
      },      
    getCurrentUser: { 
      get: function () {
          var textOfRackNCurrentUserButton = this.racknCurrentUserButton.getText();
          return textOfRackNCurrentUserButton;
        }
    }
});

module.exports = navbarPage;
