var exec = require('cordova/exec');

// `options` should be a POJO with either an email or id key present. If both are present, id will
// be preferred.
exports.startSession = function(options, success, error) {
  exec(success, error, 'Intercom', 'startSession', [options]);
};

// Show the Intercom message list
exports.openMessages = function(openAsList, success, error) {
  exec(success, error, 'Intercom', 'openMessages', [openAsList]);
};

// Update the user attributes on the Intercom user
exports.updateAttributes = function(attributes, success, error) {
  exec(success, error, 'Intercom', 'updateAttributes', [attributes]);
};

// Log a user interaction event with optional meta data
exports.logEvent = function(eventName, metaData, success, error) {
  exec(success, error, 'Intercom', 'logEvent', [eventName, metaData]);
};

// This should be called on each page view in your app, which pings Intercom for new messages
exports.checkForUnreadMessages = function(success, error) {
  exec(success, error, 'Intercom', 'checkForUnreadMessages');
};
