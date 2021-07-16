//
//  AppDelegate.m
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/16/21.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow* window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    window.rootViewController = navigationController;
    self.window = window;
    [window makeKeyAndVisible];
    return YES;
}



@end