//
//  AppDelegate.m
//  SceneKitParticleCollectionExample
//
//  Created by Luke Parham on 8/12/16.
//  Copyright © 2016 Luke Parham. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [_window setRootViewController:[[ViewController alloc] init]];
    [_window makeKeyAndVisible];
    
    return YES;
}

@end
