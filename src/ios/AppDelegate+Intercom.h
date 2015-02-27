/*
 Copyright 2015 AskU. All rights reserved.
 */

#import "AppDelegate.h"

@interface AppDelegate (Intercom)

- (BOOL)swizzled_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)applicationDidBecomeActive:(UIApplication *)application;
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken;
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;

@end
