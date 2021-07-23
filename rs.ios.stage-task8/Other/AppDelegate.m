//
//  AppDelegate.m
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/16/21.
//

#import "AppDelegate.h"
#import "ArtistController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    UIWindow* window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:[[ArtistController alloc] init]];
    window.rootViewController = navigationController;
    [self setupAppearence];
    self.window = window;
    [window makeKeyAndVisible];
    return YES;
}

- (void) setupAppearence{
    [UIBarButtonItem appearance].tintColor =[UIColor colorNamed:@"Light Green Sea"];
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17], NSForegroundColorAttributeName: [UIColor colorNamed:@"Light Green Sea"]} forState:UIControlStateNormal];
    
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17], NSForegroundColorAttributeName: [UIColor colorNamed:@"Light Green Sea"]} forState:UIControlStateHighlighted];
    [UINavigationBar appearance].backgroundColor = UIColor.whiteColor;
    [UINavigationBar appearance].titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17], NSForegroundColorAttributeName: UIColor.blackColor};
}


@end
