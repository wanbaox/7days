/*
 Erica Sadun, http://ericasadun.com
 iPhone Developer's Cookbook, 5.x Edition
 BSD License, Use at your own risk
 */

#import <UIKit/UIKit.h>

#import "SettingHelper.h"

#define COOKBOOK_PURPLE_COLOR    [UIColor colorWithRed:0.20392f green:0.19607f blue:0.61176f alpha:1.0f]
#define BARBUTTON(TITLE, SELECTOR)     [[UIBarButtonItem alloc] initWithTitle:TITLE style:UIBarButtonItemStylePlain target:self action:SELECTOR]



//#pragma mark Application Setup ----------delegate----------
//
//@interface TestBedAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>
//{
//    UIWindow *window;
//    UITabBarController *tabBarController;
//}
//
//@end
//
//@implementation TestBedAppDelegate
//
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
//{    
//    [application setStatusBarHidden:YES];
//    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    
////    if ([SettingHelper isBootFirstTime]) {
//    if(true){
//        IntroViewController * introViewController = [[IntroViewController alloc] init];
//        window.rootViewController = introViewController;
//        [window makeKeyAndVisible];
//        return YES;
//    }
//    
//    
//    // Globally use a black tint for nav bars
//    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];//导航栏左右两边文字的颜色
//    
//    // Build an array of controllers
//    NSMutableArray *controllers = [NSMutableArray array];
//    
//    //tab1
//    TAB1ViewController *controller = [[TAB1ViewController alloc]initWithNibName:@"TAB1ViewController" bundle:nil];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
////    nav.navigationBar.barTintColor = [UIColor blackColor];//上面整个颜色
//    [controllers addObject:nav];
//    
//    
//    //tab2
//    TAB2ViewController *controller2 = [[TAB2ViewController alloc]initWithNibName:@"TAB2ViewController" bundle:nil];
//    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:controller2];
//    nav2.navigationBar.barStyle = UIBarStyleDefault;
//    [controllers addObject:nav2];
//    
//    
//    //tab3
//    TAB3ViewController *controller3 = [[TAB3ViewController alloc]initWithNibName:@"TAB2ViewController" bundle:nil];
//    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:controller3];
//    nav3.navigationBar.barStyle = UIBarStyleDefault;
//    [controllers addObject:nav3];
//    
//    
//    //tab4
//    TAB4ViewController *controller4 = [[TAB4ViewController alloc]initWithNibName:@"TAB2ViewController" bundle:nil];
//    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:controller4];
//    nav4.navigationBar.barStyle = UIBarStyleDefault;
//    [controllers addObject:nav4];
//    
//    
//    tabBarController = [[XYCTabController alloc] init];
//    tabBarController.viewControllers = controllers;
//    tabBarController.customizableViewControllers = controllers;
//    tabBarController.delegate = self;
////    tabBarController.tabBar.barTintColor = [UIColor blackColor];//下面整条tab的颜色
////    tabBarController.tabBar.backgroundImage=[UIImage imageNamed:@"tab_unread_bg.png"];//下面整条tab的背景图片
//    
//    
//    
//    window.rootViewController = tabBarController;
//    [window makeKeyAndVisible];
//    return YES;
//}
//
//@end

int main(int argc, char *argv[]) {
    @autoreleasepool {
        int retVal = UIApplicationMain(argc, argv, nil, @"XYCDelegate");
        return retVal;
    }
}