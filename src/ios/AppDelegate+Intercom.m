/*
 Copyright 2015 AskU. All rights reserved.
 */

#import "AppDelegate+Intercom.h"
#import "Intercom.h"
#import <objc/runtime.h>

@implementation AppDelegate (Intercom)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method original, swizzled;

        original = class_getInstanceMethod(self, @selector(application:didFinishLaunchingWithOptions:));
        swizzled = class_getInstanceMethod(self, @selector(swizzled_application:didFinishLaunchingWithOptions:));
        method_exchangeImplementations(original, swizzled);
    });
}

- (BOOL)swizzled_application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Intercom registerForRemoteNotifications];
    return [self swizzled_application:application didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    if ([application respondsToSelector:@selector(registerUserNotificationSettings:)]) { // iOS 8
        [application registerUserNotificationSettings:
            [UIUserNotificationSettings settingsForTypes:
                (UIRemoteNotificationTypeBadge |
                 UIRemoteNotificationTypeSound |
                 UIRemoteNotificationTypeAlert)
                categories:nil]];
        [application registerForRemoteNotifications];
    } else {
        [application registerForRemoteNotificationTypes:
           (UIRemoteNotificationTypeBadge |
            UIRemoteNotificationTypeSound |
            UIRemoteNotificationTypeAlert)];
    }
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Just need an empty stub here for the Intercom SDK
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    // Just need an empty stub here for the Intercom SDK
}

@end
