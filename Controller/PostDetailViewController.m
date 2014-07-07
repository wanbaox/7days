//
//  PostDetailViewController.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-11.
//
//

#import "PostDetailViewController.h"
#import "PostDetailTableViewCell.h"
#import <CoreText/CoreText.h>
#import "ImgData.h"
#import "XYCUtils.h"
#import "UIViewExt.h"

@interface PostDetailViewController ()
{

    IBOutlet UITableView * mTableview;
    
    NSMutableArray * replys;//回复的消息
    UIFont *contentFont;
    
}

@end

@implementation PostDetailViewController

@synthesize m_post;

#define contentFont [UIFont systemFontOfSize:16.0f]
#define titleFont [UIFont systemFontOfSize:18.0f]

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.title = @"帖子详情";
        
        
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
    
    
    
    [self getData];
}

-(void)getData
{
    
    replys = [[NSMutableArray alloc]init];
    
    Post * post = [[Post alloc]initWithPostID:@"10" sort:@"22" title:@"22" content:@"1" replyNumb:0 postType:PostType_reply writerName:@"22" writerID:@"10" date:[NSDate date]];
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"11" sort:@"22" title:@"22" content:@"2" replyNumb:0 postType:PostType_reply writerName:@"11" writerID:@"22" date:[NSDate date]];
    NSArray * imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.8 url:@"" id:2], nil];
    post.imgs = imgs;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"12" sort:@"22" title:@"22" content:@"3" replyNumb:0 postType:PostType_reply writerName:@"12" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"13" sort:@"22" title:@"22" content:@"4" replyNumb:0 postType:PostType_reply writerName:@"13" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"14" sort:@"22" title:@"22" content:@"5" replyNumb:0 postType:PostType_reply writerName:@"14" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"15" sort:@"22" title:@"22" content:@"6" replyNumb:0 postType:PostType_reply writerName:@"22" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"16" sort:@"22" title:@"22" content:@"7" replyNumb:0 postType:PostType_reply writerName:@"22" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"17" sort:@"22" title:@"22" content:@"8" replyNumb:0 postType:PostType_reply writerName:@"22" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"18" sort:@"22" title:@"22" content:@"9" replyNumb:0 postType:PostType_reply writerName:@"22" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"19" sort:@"22" title:@"22" content:@"10" replyNumb:0 postType:PostType_reply writerName:@"22" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
    post = [[Post alloc]initWithPostID:@"20" sort:@"22" title:@"22" content:@"11" replyNumb:0 postType:PostType_reply writerName:@"22" writerID:@"22" date:[NSDate date]];
    post.imgs = nil;
    [replys addObject:post];
    
    
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    //先用下面的方法计算文字的高度，
//    NSString * content;
//    NSString * title;
//    if (indexPath.row == 0) {
//        
//        content = m_post.content;
//        title = m_post.title;
//        
//    }else{
//        
//        Post * reply = [replys objectAtIndex:indexPath.row-1];
//        
//        content = reply.content;
//        title = reply.title;
//        
//    }
//    
//    CGSize size = [content sizeWithFont:contentFont constrainedToSize:CGSizeMake(280, 20000)];
//    CGFloat height = size.height;
//    
//    CGSize sizeTitle = [title sizeWithFont:titleFont constrainedToSize:CGSizeMake(280, 20000)];
//    CGFloat heightTitle = sizeTitle.height;
//    
//    height += heightTitle;
//    height+=380;
//    
//    return height;

    
//    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
//    NSLog(@"height for cell:%f",cell.frame.size.height);
//    return cell.frame.size.height;
    
    
    //这里可能需要事先知道图片尺寸（或者图片比例(图片宽度固定，高度需要缩放)）
    
    return [self heightForCellRowAtIndexPath:indexPath];
    
}

-(CGFloat)heightForCellRowAtIndexPath:(NSIndexPath *)indexPath
{
    Post * post;
    if (indexPath.row == 0) {
        
        post = m_post;
        
    }else{
        
        post = [replys objectAtIndex:indexPath.row-1];
        
    }
    
    CGFloat cellHeight;
    
    //头像上边距＋头像高度＋title上边距＋title高度＋content上边距＋content高度＋图片上边距＋图片高度＋...＋头像下边距
    cellHeight += padding_bg_Top;
    cellHeight += size4Head;
    
    //title
    if (post.title && post.title.length>0) {
        
        
        CGSize sizeTitle = [post.title sizeWithFont:titleFont constrainedToSize:CGSizeMake(280, 20000)];
        CGFloat heightTitle = sizeTitle.height;
        
        cellHeight += padding_item_level_1;
        cellHeight +=heightTitle;
    }
    
    CGSize size = [post.content sizeWithFont:contentFont constrainedToSize:CGSizeMake(280, 20000)];
    CGFloat height = size.height;
    cellHeight += padding_item_level_0;
    cellHeight +=height;
    
    if (post.imgs && post.imgs.count>0) {
        
        for (ImgData * data in post.imgs) {
            
            cellHeight += padding_item_level_0;
            
            CGFloat imgWidth;
            if (indexPath.row == 0) {
                
                //帖子
                imgWidth = [XYCUtils screenFrame].size.width-2*padding_bg_left;
                
            }else{
                
                //回复
                imgWidth = [XYCUtils screenFrame].size.width-2*padding_bg_left-size4Head;
            }
            
            cellHeight += imgWidth*data.ratio;
            
        }
        
        
    }
    
    
    cellHeight += padding_bg_Top;
    
    return cellHeight;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (replys) {
        return replys.count+1;
    }else{
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString *cellIn=nil;
    PostDetailTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIn];
    
    Post * post;
    if (indexPath.row == 0) {
        
        post = m_post;
        
    }else{
        
        post = [replys objectAtIndex:indexPath.row-1];
        
    }
    
    
    if(cell==nil){
        
        
        cell=[[PostDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIn post:post];
    }
    
    if (post.imgs && post.imgs.count>0) {
        
        for (UIImageView * img in cell.imgs) {
            
            img.image = [UIImage imageNamed:@"bg_tableview_content_img"];
        }
        
        
    }
    
    NSString * content;
    
    if (indexPath.row == 0) {
        
        content = m_post.content;
        
    }else{
        
        Post * reply = [replys objectAtIndex:indexPath.row-1];
        
        content = reply.content;
        
    }
    
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

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/



@end
