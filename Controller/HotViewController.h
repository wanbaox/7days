//
//  HotViewController.h
//  HelloWorld
//
//  Created by 谢元潮 on 14-4-10.
//
//

#import <UIKit/UIKit.h>

@interface HotViewController : UIViewController<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>
{
    
    CGFloat userContentOffsetX;
    BOOL isLeftScroll;
    
    IBOutlet UIButton * m_btn0;
    IBOutlet UIButton * m_btn1;
    IBOutlet UIImageView * shadowImageView;
    
    IBOutlet UIScrollView * m_scrollView;
    
    IBOutlet UINavigationBar * naviBar;
    
    IBOutlet UINavigationItem * naviItem;
    
    UITableView * tableview0;
    UITableView * tableview1;
    
    
}

-(IBAction)goBack:(id)sender;

@end
