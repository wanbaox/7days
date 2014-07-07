//
//  XYCDelegate.h
//  HelloWorld
//
//  Created by 谢元潮 on 14-6-7.
//
//

#import <Foundation/Foundation.h>

@interface XYCDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate>
{
    UIWindow *window;
    UITabBarController *tabBarController;
}

@end
