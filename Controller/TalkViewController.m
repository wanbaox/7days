//
//  TalkViewController.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-16.
//
//

#import "TalkViewController.h"
#import "User7D.h"
#import "XYCUtils.h"
#import "TalkMsg.h"
#import "TalkViewCell.h"
#import "XYCBubbleLabel.h"

User7D * userTalkTo;//聊天对方user


@interface TalkViewController ()
{
    
    IBOutlet UITableView * mTableView;
    
    NSMutableArray * msgs;
    
    ShowBanner showBanner;
    
    XYCTalkInputBar * inputBar;
    UITapGestureRecognizer *singleTapGR;
 
}

@end

@implementation TalkViewController

#define contentFontSize 14      //聊天内容文字大小
#define maxContentLength 240    //聊天内容最大长度

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // Custom initialization
        self.title = userTalkTo.username;
        
        showBanner = ShowBannerNull;
        
        //防止在ios7上出现，tableview被nav遮住的情况
//        NSComparisonResult order = [[UIDevice currentDevice].systemVersion compare: @"7.0" options: NSNumericSearch];
//        if (order == NSOrderedSame || order == NSOrderedDescending)
//        {
//            // OS version >= 7.0
//            self.edgesForExtendedLayout = UIRectEdgeNone;
//        }
        
        
        
        //聊天输入框
        CGRect frame = [XYCUtils screenFrame];
        inputBar = [[XYCTalkInputBar alloc]initWithFrame:CGRectMake(0, frame.size.height-44, 320, 44)];
        [self.view addSubview:inputBar];
        inputBar.delegate = self;
        
        
        self.hidesBottomBarWhenPushed = YES;
        
    }
    
    return self;
}

-(void)backAction:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    [self initKeyboardEvent];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    if (msgs && msgs.count>0) {
        
        [mTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:msgs.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        
    }
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark 键盘事件

- (void)initKeyboardEvent {
    
    //通过tap来隐藏键盘，然后通过获取键盘隐藏事件，来设置坐标
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    
    //监听键盘show的事件
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    
    //此method会将self.view里所有的subview的first responder都resign掉
    
    
    if ([inputBar getShowBanner] == ShowBannerNull) {
        
        //表示是显示键盘，或者什么都没显示
        [self.view endEditing:YES];
    }else{
        
        [inputBar endInput];
    }
    
}

#pragma mark - talk input bar
-(void)keyboardHided:(CGFloat)hightVisibleFromBottom
{
    
    CGRect frame = [XYCUtils screenFrame];
    mTableView.frame = CGRectMake(mTableView.frame.origin.x, mTableView.frame.origin.y, mTableView.frame.size.width, frame.size.height-hightVisibleFromBottom);
    
    
    //移除singletapgr
    [self.view removeGestureRecognizer:singleTapGR];
    
}

-(void)keyboardShowed:(CGPoint)barPosition
{
    
    mTableView.frame = CGRectMake(mTableView.frame.origin.x, mTableView.frame.origin.y, mTableView.frame.size.width, barPosition.y);
    
}

#pragma mark - Table view data source


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
    
    TalkMsg * msg = [msgs objectAtIndex:indexPath.row];
    
    
    CGFloat labelheight = [XYCUtils labelHeigtFromStringContent:msg.content fontSizeandLabelWidth:280 andFontSize:contentFontSize];
    
    return labelheight;
    
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
//    if (msgs) {
//        
//        return msgs.count;
//    }
    
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"TalkViewCell";
    TalkViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TalkViewCell"
                                              owner:self
                                            options:nil] lastObject];
        
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    
    
    TalkMsg * msg = [msgs objectAtIndex:indexPath.row];
    
    
    cell.label_date.text = [XYCUtils dateFormate4TalkListQQ:msg.date];
    
    cell.label_date.text = @"5.6";
    if (indexPath.row == 0) {
        
        [cell.label_content setText:@"sdfasdfasdfsdfasdfa"];
        cell.label_content.isLeft = NO;
        
        
        cell.img_head_right.layer.cornerRadius = 4;
        cell.img_head_right.layer.masksToBounds = YES;
        
        [cell.img_head_left removeFromSuperview];
        
        
    }else if (indexPath.row == 1) {
        
        [cell.label_content setText:@"sdfasdfasdfsdfasdfa我是DOS地方后 i士大夫 i 家哦 i 收到份骄傲 i速度发生的发生地方速度发生的发生都发生的发"];
        cell.label_content.isLeft = NO;
        
        
        cell.img_head_right.layer.cornerRadius = 4;
        cell.img_head_right.layer.masksToBounds = YES;
        
        [cell.img_head_left removeFromSuperview];
        
        
    }else{
        
        [cell.label_content setText:@"sdfasdfasdfsdfasdfa我是DOS地方后 i士大夫 i 家哦 i 收到份骄傲 i速度发生的发生地方速度发生的发生都发生的发"];
        cell.label_content.isLeft = YES;
        
        
        cell.img_head_left.layer.cornerRadius = 4;
        cell.img_head_left.layer.masksToBounds = YES;
        
        [cell.img_head_right removeFromSuperview];
        
    }
    
    cell.label_content.maxWidth = 200;
    
    
    
    return cell;
}

@end
