/*
 Copyright 2015 AskU. All rights reserved.
 */

#import <Foundation/Foundation.h>
#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

@interface CordovaIntercom : CDVPlugin
{
    // empty
}

- (void) startSession:(CDVInvokedUrlCommand*)command;
- (void) openMessages:(CDVInvokedUrlCommand*)command;
- (void) updateAttributes:(CDVInvokedUrlCommand*)command;
- (void) logEvent:(CDVInvokedUrlCommand*)command;
- (void) checkForUnreadMessages:(CDVInvokedUrlCommand*)command;
- (void) setDeviceToken:(CDVInvokedUrlCommand*)command;

@end
