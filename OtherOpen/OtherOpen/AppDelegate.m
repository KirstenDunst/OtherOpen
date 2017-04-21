//
//  AppDelegate.m
//  OtherOpen
//
//  Created by CSX on 2017/4/21.
//  Copyright © 2017年 宗盛商业. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
     NSLog(@"%@", launchOptions);
    
    return YES;
}
#pragma mark -
#pragma mark Image view

#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_9_0
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation
{
    
    UINavigationController *navigation = (UINavigationController *)application.keyWindow.rootViewController;
    ViewController *displayController = (ViewController *)navigation.topViewController;
    
    [displayController.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]]];
    [displayController.label setText:sourceApplication];
    
    NSLog(@">>>>>>>>>>>>>>>%@,%@,%@,%@",application,url,sourceApplication,annotation);
    return YES;
}

#else
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options
{
    UINavigationController *navigation = (UINavigationController *)application.keyWindow.rootViewController;
    ViewController *displayController = (ViewController *)navigation.topViewController;
    
    [displayController.imageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:url]]];
    [displayController.label setText:[options objectForKey:UIApplicationOpenURLOptionsSourceApplicationKey]];
    NSLog(@">>>>>>>>>>>>>>>%@,%@,%@",application,url,options);
    NSData *da = [NSData dataWithContentsOfURL:url];
    NSLog(@"转变为data然后再在自己的app中还原>>>>>>>>>>>>data文件：%@",da);
     displayController.da = da;
    
    
    //因为有沙盒，这里如果有其他需要，可以归档解档存储操作。
    
    
    return YES;
}
#endif




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
