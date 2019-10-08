//
//  AppDelegate.m
//  study_objc
//
//  Created by MyMacBookPro on 06/10/2019.
//  Copyright © 2019 Maverick DevStudioa. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    __block UIBackgroundTaskIdentifier background_task; //Create a task object
    background_task = [application beginBackgroundTaskWithExpirationHandler: ^ {
        
        NSLog(@"beginBackgroundTaskWithExpirationHandler");
        [application endBackgroundTask: background_task]; //Tell the system that we are done with the tasks
        background_task = UIBackgroundTaskInvalid; //Set the task to be invalid
        //System will be shutting down the app at any point in time now
    }];
    
    //Background tasks require you to use asyncrous tasks
    dispatch_async(dispatch_queue_create("background", 0),^{
        //Perform your tasks that your application requires
        NSLog(@"\n\nRunning in the background!\n\n");
        
        while(1){
            
            if(application.applicationState == UIApplicationStateActive){
                break;
            }
            
            NSLog(@"ping in app delegate");
//            [[MFNetwork sharedInstance] sendPing:nil];
            
            [NSThread sleepForTimeInterval:3];
            
        }
        
        
        NSLog(@"@@@@@@@@@@@@@");
        
        [application endBackgroundTask: background_task]; //End the task so the system knows that you are done with what you need to perform
        background_task = UIBackgroundTaskInvalid; //Invalidate the background_task
    });
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog([application description]);
    NSLog(@"application will enter foreground");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"application will terminate");
}


@end
