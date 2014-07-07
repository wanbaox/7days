//
//  PostListVC.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-19.
//
//

#import "PostListVC.h"
#import "Post.h"
#import "PostListCell.h"
#import "XYCUtils.h"

@interface PostListVC ()
{
    
    IBOutlet UITableView * mTableView;
    
    NSMutableArray * posts;//回复的消息
    UIFont *contentFont;
    
    XYCTalkInputBar * inputBar;
    UITapGestureRecognizer *singleTapGR;
    
}
@end

@implementation PostListVC

#define contentFont [UIFont systemFontOfSize:16.0f]
#define titleFont [UIFont systemFontOfSize:18.0f]

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"动态";
        
        
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
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;//自定义leftbutton之后，手势返回的会失效，加上这个就可以了，而且不能放在initwithinibname里面。
    //    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    
    
    posts = [[NSMutableArray alloc]init];
    
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"止在ios7上出现，tableview被nav遮住的情,止在ios7上出止在ios7上出现，tableview被nav遮住的情止在ios7上出现，tableview被nav遮住的情止在ios7上出现，tableview被nav遮住的情" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    [posts addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    
    [self initKeyboardEvent];
    
    
    
    //这个必须要放在self.navigationController.interactivePopGestureRecognizer.delegate = self后面，否则收拾返回的功能就失效了
    
    //聊天输入框
    CGRect frame = [XYCUtils screenFrame];
    inputBar = [[XYCTalkInputBar alloc]initWithFrame:CGRectMake(0, frame.origin.y+frame.size.height, 320, 44)];
    [self.view addSubview:inputBar];
    inputBar.delegate = self;
    
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
    
    //监听键盘hide的事件
    [self.view removeGestureRecognizer:singleTapGR];
    
}

-(void)keyboardShowed:(CGPoint)barPosition
{
    
    mTableView.frame = CGRectMake(mTableView.frame.origin.x, mTableView.frame.origin.y, mTableView.frame.size.width, barPosition.y);
    
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //先用下面的方法计算文字的高度，
//    NSString * content;
//    NSString * title;
//    
//    
//    Post * reply = [posts objectAtIndex:indexPath.row];
//    
//    content = reply.content;
//    title = reply.title;
//    CGSize size = [content sizeWithFont:contentFont constrainedToSize:CGSizeMake(280, 20000)];
//    CGFloat height = size.height;
//    
//    CGSize sizeTitle = [title sizeWithFont:titleFont constrainedToSize:CGSizeMake(280, 20000)];
//    CGFloat heightTitle = sizeTitle.height;
//    
//    height += heightTitle;
//    height+=320;
    
    return [self heightForCellRowAtIndexPath:indexPath];
    
}
-(CGFloat)heightForCellRowAtIndexPath:(NSIndexPath *)indexPath
{
    Post * post = [posts objectAtIndex:indexPath.row];
    
    CGFloat cellHeight;
    
    //头像上边距＋头像高度＋title上边距＋title高度＋图片上边距＋图片高度＋content上边距＋content高度＋赞button上边距＋赞button高度＋padding_content_top
    cellHeight += padding_content_Top;
    cellHeight += size4Head;
    
    //title
    if (post.title && post.title.length>0) {
        
        
        CGSize sizeTitle = [post.title sizeWithFont:titleFont constrainedToSize:CGSizeMake(280, 20000)];
        CGFloat heightTitle = sizeTitle.height;
        
        cellHeight += padding_item_level_1;
        cellHeight +=heightTitle;
    }
    
    //img
    cellHeight += padding_item_level_0;
    cellHeight += height_img_content;
    
    //content
    //做多三行
    CGSize threeLineHeight = [@"1 \n 2 \n 3" sizeWithFont:contentFont constrainedToSize:CGSizeMake(280, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize size = [post.content sizeWithFont:contentFont constrainedToSize:CGSizeMake(280, 20000)];
    CGFloat height = size.height;
    cellHeight += padding_item_level_0;
    cellHeight +=height>threeLineHeight.height?threeLineHeight.height:height;
    
    //button
    cellHeight += padding_item_level_1;
    cellHeight += height_button;
    
    //bottom padding
    cellHeight += padding_content_Top-padding_bg_Top;
    
    return cellHeight;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   return posts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString *cellIn=@"PostDetailCell";
    PostListCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIn];
    
    
    if(cell==nil){
        cell=[[PostListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIn];
    }
    
    //    if(indexPath.row==0||indexPath.row==1){
    
    cell.img_content.image = [UIImage imageNamed:@"bg_tableview_content_img"];
    
    //    }
    
    NSString * content;
    
    Post * post = [posts objectAtIndex:indexPath.row];
    
    content = post.content;
    
    cell.label_content.text=content;
    cell.label_title.text = post.title;
    cell.label_date.text = @"3分钟前";
    cell.label_name.text = @"草泥马";
    
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
     
     [inputBar startInput];
     
 }

@end
