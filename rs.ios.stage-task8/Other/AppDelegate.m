//
//  AppDelegate.m
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/16/21.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "rs_ios_stage_task8-Swift.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow* window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[DrawingController alloc] init]];
    window.rootViewController = navigationController;
    [UIBarButtonItem appearance].tintColor =[UIColor colorNamed:@"Light Green Sea"];
    
    navigationController.navigationBar.backgroundColor = UIColor.whiteColor;
    navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17], NSForegroundColorAttributeName: UIColor.blackColor};
    self.window = window;
    [window makeKeyAndVisible];
    return YES;
}



@end
