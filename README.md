# Hey, the awesome guys at Intercom released an [official cordova plugin](https://github.com/intercom/intercom-cordova). Use that instead!

# cordova-intercom

## Install

```sh
$ cordova plugin add co.asku.cordova.intercom --variable API_KEY="ios_sdk-0000..." --variable APP_ID="zz..."
```

## JS API

All functions are on the `cordova.plugins.intercom` object.

### `startSession`

Starts the user's session using their unique identifier (either or email or id).

```js
cordova.plugins.intercom.startSession({ id: 1 });
// OR
cordova.plugins.intercom.startSession({ email: 'user@asku.co' });
```

### `openMessages`

Opens the Intercom messages list UI.

```js
cordova.plugins.intercom.openMessages();
```

### `updateAttributes`

Updates the user properties for this user in Intercom.

```js
cordova.plugins.intercom.updateAttributes({
  name: 'Josh',
  favorite_pizza: 'pepperoni'
});
```

### `logEvent`

Sends a user interaction event to Intercom.

```js
cordova.plugins.intercom.logEvent('ate-pizza', {
  flavor: 'cheese'
});
```

### `checkForUnreadMessages`

Tell Intercom to look for unread messages and present them to the user, overlayed on the web
content. It's recommended to call this between each page view.

```js
cordova.plugins.intercom.checkForUnreadMessages();
```
