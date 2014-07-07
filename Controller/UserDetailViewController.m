//
//  UserDetailViewController.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-14.
//
//

#import "UserDetailViewController.h"
#import "Post.h"
#import "UserDetailTableViewCell.h"

@interface UserDetailViewController ()
{
    
    XYCTableviewHeader * tableHeader;
    UIButton * btn_back;
    
    NSMutableArray * postArray;
}

@end

@implementation UserDetailViewController

#define contentFont [UIFont systemFontOfSize:16.0f]

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"个人中心";
        
        
        //防止在ios7上出现，tableview被nav遮住的情况
        //        NSComparisonResult order = [[UIDevice currentDevice].systemVersion compare: @"7.0" options: NSNumericSearch];
        //        if (order == NSOrderedSame || order == NSOrderedDescending)
        //        {
        //            // OS version >= 7.0
        //            self.edgesForExtendedLayout = UIRectEdgeNone;
        //        }
        
//        self.edgesForExtendedLayout = UIRectEdgeAll;
        
//        self.wantsFullScreenLayout = YES;
//        self.modalPresentationStyle = UIModalPresentationFullScreen;
        
        
        
//        self.navigationItem.backBarButtonItem.title = @"";//如果直接hide backbutton，那么导航栏上有可能出现三个点，这样设置之后，就不会出现了
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btn_back_normal"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
        
        self.hidesBottomBarWhenPushed = YES;
        
        
    }
    return self;
}

-(void)backAction
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;//自定义leftbutton之后，手势返回的会失效，加上这个就可以了，而且不能放在initwithinibname里面。
    
    tableHeader = [[XYCTableviewHeader alloc]initWithBGImage:[UIImage imageNamed:@"user_detail_head_img_bg"]];
    
    self.tableView.contentInset = UIEdgeInsetsMake(tableHeader.heightNormal, 0, 0, 0);
    [self.tableView addSubview:tableHeader];
    
    
    btn_back = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_back setBackgroundImage:[UIImage imageNamed:@"btn_back_normal"] forState:UIControlStateNormal];
    [self.view addSubview:btn_back];
    [btn_back addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //TODO
    
    postArray = [[NSMutableArray alloc]init];
    
    [postArray addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"止在ios7上出现，tableview被nav遮住的情,止在ios7上出现，被nav遮住的情止在i，tableview被nav遮住的情" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    
    [postArray addObject:[[Post alloc]initWithPostID:@"22" sort:@"22" title:@"22" content:@"止在ios7上出现，tableview被nav遮住的情,止在ios7上出现，tableview被nav遮住的情止在ios7上出现，tableview被nav遮住的情止在ios7上出现，tableview被nav遮住的情止在ios7上出现，tableview被nav遮住的情止在ios7上出现，tableview被nav遮住的情止在ios7上出现，tableview被nav遮住的情" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]]];
    
}



- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [btn_back setFrame:CGRectMake(10, 20+self.view.frame.origin.y+scrollView.contentOffset.y, 30, 25)];
    [tableHeader reDraw:scrollView];
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //先用下面的方法计算文字的高度，
    
    Post *post = [postArray objectAtIndex:indexPath.row];
    
    
    CGSize size = [post.content sizeWithFont:contentFont constrainedToSize:CGSizeMake(280, 20000)];
    CGFloat height = size.height;
    
    //    if (height<30) //评论年内容的高度
    //    {
    //        height = 30;
    //    }else{
    //        height += 10;
    //    }
    
    // NSIndexPath *indexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
    
    height+=200;//图片高度
    
    height+=80; //加上“评论人”和“时间”Label的高度；
    
    return height;
    
    
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    
//    return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (postArray) {
        return postArray.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static  NSString *cellIn=@"PostDetailCell";
    UserDetailTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIn];
    
    
    if(cell==nil){
        cell=[[UserDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIn];
    }
    
    if(indexPath.row==0||indexPath.row==1){
        
        cell.img_content.image = [UIImage imageNamed:@"bg_tableview_content_img"];
        
    }
    
    Post *post = [postArray objectAtIndex:indexPath.row];
    
    cell.label_content.text=post.content;
    cell.label_title.text = @"时间都去哪儿了？";
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
