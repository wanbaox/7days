//
//  XYCTabController.m
//  HelloWorld
//
//  Created by 谢元潮 on 14-6-7.
//
//

#import "XYCTabController.h"
#import "WritePostViewController.h"
#import "CHTumblrMenuView.h"

@implementation XYCTabController

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return YES;
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.4f];
//    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    [animation setType:kCATransitionFade]; //淡入淡出
    [animation setSubtype:kCATransitionFromLeft];
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
}

-(void) addCenterButtonWithImage:(UIImage*)buttonImage highlightImage:(UIImage*)highlightImage
{
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(midBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    button.center = CGPointMake(self.tabBar.frame.size.width/2, self.tabBar.frame.size.height/2);
    [self.tabBar addSubview:button];
    
}

-(void)midBtnClicked
{
    
    
    CHTumblrMenuView *menuView = [[CHTumblrMenuView alloc] init];
    [menuView addMenuItemWithTitle:@"Text" andIcon:[UIImage imageNamed:@"post_type_bubble_text.png"] andSelectedBlock:^{
        
        // 显示 写post界面
        WritePostViewController * writePost = [[WritePostViewController alloc]initWithNibName:@"WritePostViewController" bundle:nil];
        
        [self presentViewController:writePost animated:YES completion:^{
            
            NSLog(@"present finished");
            
        }];

    }];
    
    [menuView addMenuItemWithTitle:@"Photo" andIcon:[UIImage imageNamed:@"post_type_bubble_photo.png"] andSelectedBlock:^{
        NSLog(@"Photo selected");
    }];
    
    [menuView addMenuItemWithTitle:@"Quote" andIcon:[UIImage imageNamed:@"post_type_bubble_quote.png"] andSelectedBlock:^{
        NSLog(@"Quote selected");
        
    }];
    
    [menuView addMenuItemWithTitle:@"Link" andIcon:[UIImage imageNamed:@"post_type_bubble_link.png"] andSelectedBlock:^{
        NSLog(@"Link selected");
        
    }];
    
    [menuView addMenuItemWithTitle:@"Chat" andIcon:[UIImage imageNamed:@"post_type_bubble_chat.png"] andSelectedBlock:^{
        NSLog(@"Chat selected");
        
    }];
    
    [menuView addMenuItemWithTitle:@"Video" andIcon:[UIImage imageNamed:@"post_type_bubble_video.png"] andSelectedBlock:^{
        NSLog(@"Video selected");
        
    }];
    
    [menuView show];
    
    
}

@end