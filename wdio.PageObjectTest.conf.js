//-cat OverRides for PageObject Testing

//-cat not the insertion
const wdioConfig = require('./wdio.conf.js');

wdioConfig.config.capabilities = [{
    browserName: 'chrome',
}];
wdioConfig.config.logLevel = 'silent',
wdioConfig.config.baseUrl = 'https://rackn.github.io/provision-ux',
wdioConfig.config.specs = [ __dirname + '/src/pospecs/*.spec.js' ],
wdioConfig.config.services = ['selenium-standalone', 'visual-regression'];
wdioConfig.config.framework = 'mocha';

exports.config = wdioConfig.config;
