//
//  XYCDelegate.m
//  HelloWorld
//
//  Created by 谢元潮 on 14-6-7.
//
//

#import "XYCDelegate.h"

#import "TAB1ViewController.h"
#import "TAB2ViewController.h"
#import "TAB3ViewController.h"
#import "TAB4ViewController.h"
#import "TabMiddleViewController.h"

#import "XYCTabController.h"
#import "IntroViewController.h"

#import "SettingHelper.h"

@implementation XYCDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [application setStatusBarHidden:YES];
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    
    if ([SettingHelper isBootFirstTime]) {
//    if(true){
        
        IntroViewController * introViewController = [[IntroViewController alloc] init];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:introViewController];
        //    nav.navigationBar.barTintColor = [UIColor blackColor];//上面整个颜色
        
        nav.navigationBarHidden = YES;
        window.rootViewController = nav;
        [window makeKeyAndVisible];
        return YES;
    }
    
    
    // Globally use a black tint for nav bars
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:30.0f/255.0f green:144.0f/255.0f blue:255.0f/255.0f alpha:1.0f]];//导航栏左右两边文字的颜色
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:20],UITextAttributeFont, nil]];
    
    
    // Build an array of controllers
    NSMutableArray *controllers = [NSMutableArray array];
    
    //tab1
    TAB1ViewController *controller = [[TAB1ViewController alloc]initWithNibName:@"TAB1ViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    //    nav.navigationBar.barTintColor = [UIColor blackColor];//上面整个颜色
    [controllers addObject:nav];
    
    
    //tab2
    TAB2ViewController *controller2 = [[TAB2ViewController alloc]initWithNibName:@"TAB2ViewController" bundle:nil];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:controller2];
    nav2.navigationBar.barStyle = UIBarStyleDefault;
    [controllers addObject:nav2];
    
    
    //中间的tab
    {
        
        //middle
        TabMiddleViewController *controllerMiddle = [[TabMiddleViewController alloc]initWithNibName:@"TabMiddleViewController" bundle:nil];
        UINavigationController *navMiddle = [[UINavigationController alloc] initWithRootViewController:controllerMiddle];
        navMiddle.navigationBar.barStyle = UIBarStyleDefault;
        [controllers addObject:navMiddle];
        
    }
    
    //tab3
    TAB3ViewController *controller3 = [[TAB3ViewController alloc]initWithNibName:@"TAB3ViewController" bundle:nil];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:controller3];
    nav3.navigationBar.barStyle = UIBarStyleDefault;
    [controllers addObject:nav3];
    
    
    //tab4
    TAB4ViewController *controller4 = [[TAB4ViewController alloc]initWithNibName:@"TAB4ViewController" bundle:nil];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:controller4];
    nav4.navigationBar.barStyle = UIBarStyleDefault;
    [controllers addObject:nav4];
    
    
    tabBarController = [[XYCTabController alloc] init];
    tabBarController.viewControllers = controllers;
    tabBarController.customizableViewControllers = controllers;
    tabBarController.delegate = self;
    //    tabBarController.tabBar.barTintColor = [UIColor blackColor];//下面整条tab的颜色
    //    tabBarController.tabBar.backgroundImage=[UIImage imageNamed:@"tab_unread_bg.png"];//下面整条tab的背景图片
    tabBarController.tabBar.translucent = NO;//如果这里不设置，那第一个tab里面有mapview，当从这个tab切换到其他viewcontroller，然后返回的时候，发现这时候tabbar已经变成透明的了。不知道why
    
    
    //tabbar中间的按钮
    [(XYCTabController*)tabBarController addCenterButtonWithImage:[UIImage imageNamed:@"tab_write_post"] highlightImage:nil];
    
    window.rootViewController = tabBarController;
    [window makeKeyAndVisible];
    return YES;
}

@end



