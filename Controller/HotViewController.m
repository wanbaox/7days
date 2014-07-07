//
//  HotViewController.m
//  HelloWorld
//
//  Created by 谢元潮 on 14-4-10.
//
//

#import "HotViewController.h"

@interface HotViewController ()

@end

@implementation HotViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"热点";
        
        
        //防止在ios7上出现，tableview被nav遮住的情况
//        NSComparisonResult order = [[UIDevice currentDevice].systemVersion compare: @"7.0" options: NSNumericSearch];
//        if (order == NSOrderedSame || order == NSOrderedDescending)
//        {
//            // OS version >= 7.0
//            self.edgesForExtendedLayout = UIRectEdgeNone;
//        }
        
        self.navigationItem.backBarButtonItem.title = @"";//如果直接hide backbutton，那么导航栏上有可能出现三个点，这样设置之后，就不会出现了
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_back_normal"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];

        
        
        self.hidesBottomBarWhenPushed = YES;
        
    }
    
    return self;
}
-(void)backAction
{
    self.navigationItem.backBarButtonItem.title = @"";//如果直接hide backbutton，那么导航栏上有可能出现三个点，这样设置之后，就不会出现了
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(IBAction)goBack:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:^(void){
    
    }];
}

-(void)viewWillDisappear:(BOOL)animated{

//    NSLog(@"view will disappear");
    
    [super viewWillDisappear:animated];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    m_scrollView.pagingEnabled = YES;
//    m_scrollView.userInteractionEnabled = YES;
//    m_scrollView.bounces = NO;
    
    m_scrollView.showsHorizontalScrollIndicator = NO;
    m_scrollView.showsVerticalScrollIndicator = NO;
    
    
    
    tableview0 = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 320) style:UITableViewStylePlain];
    tableview0.delegate = self;
    tableview0.dataSource = self;
    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//    label.text = [NSString stringWithFormat:@"测试0"];
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont boldSystemFontOfSize:50.0];
    [m_scrollView addSubview:tableview0];
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(320, 0, 320, 320)];
    label.text = [NSString stringWithFormat:@"测试1"];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:50.0];
    [m_scrollView addSubview:label];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [m_scrollView setContentSize:CGSizeMake(320*2, m_scrollView.frame.size.height)];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    userContentOffsetX = scrollView.contentOffset.x;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (userContentOffsetX < scrollView.contentOffset.x) {
        isLeftScroll = YES;
    }
    else {
        isLeftScroll = NO;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    //调整顶部滑条按钮状态
    
    int selected = (int)scrollView.contentOffset.x/320;
    
    //滑动选中按钮
    
    [UIView animateWithDuration:0.25 animations:^{
        
        [shadowImageView setCenter:CGPointMake((selected == 0)?m_btn0.center.x:m_btn1.center.x, shadowImageView.center.y)];
        
    } completion:^(BOOL finished) {
        
//        if (finished) {
//            if (!button.selected) {
//                button.selected = YES;
//                userSelectedChannelID = button.tag;
//            }
//        }
        
    }];
    
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

//    static NSString *CellIdentifier = @"Cell";
//    Tab0ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    
//    if (!cell) {
//        
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"Tab0ViewCell"
//                                              owner:self
//                                            options:nil] lastObject];
//        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
//        
//    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = @"text";
    
    return (UITableViewCell *)cell;
    
}

@end
