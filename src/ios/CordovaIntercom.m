/*
 Copyright 2015 AskU. All rights reserved.
 */

#import <Cordova/CDV.h>
#import <Cordova/CDVPlugin.h>

#import "CordovaIntercom.h"
#import "Intercom.h"

@implementation CordovaIntercom : CDVPlugin

- (void) pluginInitialize
{
    NSString* apiKey = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"IntercomApiKey"];
    NSString* appId  = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"IntercomAppId"];

    [Intercom setApiKey:apiKey forAppId:appId];
}

- (void) startSession:(CDVInvokedUrlCommand*)command
{
    // Error handling block to be used for both email and id sessions.
    void (^errorHandler)(NSError* error) = ^(NSError* error) {
        CDVPluginResult* pluginResult;
        if (error) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    };

    NSDictionary* options = [command.arguments objectAtIndex:0];
    NSString* userId      = [options valueForKey:@"id"];
    NSString* userEmail   = [options valueForKey:@"email"];

    if (userId) {
        [Intercom beginSessionForUserWithUserId:userId completion:errorHandler];
    } else {
        [Intercom beginSessionForUserWithEmail: userEmail completion:errorHandler];
    }
}

- (void) openMessages:(CDVInvokedUrlCommand *)command
{
    BOOL openAsConversationList = [command.arguments objectAtIndex:0] || YES;
    [Intercom presentMessageViewAsConversationList:openAsConversationList];
}

- (void) updateAttributes:(CDVInvokedUrlCommand*)command
{
    NSDictionary* attributes = [command.arguments objectAtIndex:0];
    [Intercom updateUserWithAttributes:attributes completion:^(NSError *error) {
        CDVPluginResult* pluginResult;
        if (error) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) logEvent:(CDVInvokedUrlCommand*)command
{
    NSString* eventName    = [command.arguments objectAtIndex:0];
    NSDictionary* metaData = [command.arguments objectAtIndex:1];

    [Intercom logEventWithName:eventName optionalMetaData:metaData completion:^(NSError *error) {
        CDVPluginResult* pluginResult;
        if (error) {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        } else {
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
        }

        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }];
}

- (void) checkForUnreadMessages:(CDVInvokedUrlCommand*)command
{
    [Intercom checkForUnreadMessages];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end
