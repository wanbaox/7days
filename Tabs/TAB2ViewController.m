//
//  TAB2ViewController.m
//  HelloWorld
//
//  Created by 谢元潮 on 14-4-10.
//
//

#import "TAB2ViewController.h"
#import "HotViewController.h"
#import "TalkViewController.h"
#import "Tab2Cell.h"
#import "MsgRecent.h"
#import "DBHelper.h"
#import "PostListVC.h"
#import "XYCUtils.h"

@interface TAB2ViewController ()
{

    NSMutableArray * msgRecents;
    
}
@end

@implementation TAB2ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
        self.title = @"消息";
        
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:self.title image:[UIImage imageNamed:@"tab1.png"] selectedImage:[UIImage imageNamed:@"tab1_selected.png"]];
        
        
        //右边按钮
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"聊天" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
        
    }
    
    return self;
}

-(void)rightAction:(id)sender
{
    
    [self.navigationController pushViewController:[[TalkViewController alloc] initWithNibName:@"TalkViewController" bundle:nil] animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated
{

    [super viewDidAppear:animated];
    
    [XYCUtils tableViewsetExtraCellLineHidden:self.tableView];
    
    //test
//    for (int i = 1 ; i < 8; i++) {
//        
//        
//        [[DBHelper sharedInstance] saveMsgFromID:[NSString stringWithFormat:@"%i",i] fromname:[NSString stringWithFormat:@"%i",i] fromheadurl:[NSString stringWithFormat:@"%i",i] msgtype:i content:[NSString stringWithFormat:@"%i",i] date:[NSDate date] isreaded:NO];
//        
//    }
//    
//    int i = 111;
//    
//    [[DBHelper sharedInstance] saveMsgFromID:[NSString stringWithFormat:@"%i",i] fromname:[NSString stringWithFormat:@"%i",i] fromheadurl:[NSString stringWithFormat:@"%i",i] msgtype:MsgTypeOther content:[NSString stringWithFormat:@"%i",i] date:[NSDate date] isreaded:NO];
//    
//    i = 112;
//    
//    [[DBHelper sharedInstance] saveMsgFromID:[NSString stringWithFormat:@"%i",i] fromname:[NSString stringWithFormat:@"%i",i] fromheadurl:[NSString stringWithFormat:@"%i",i] msgtype:MsgTypeOther content:[NSString stringWithFormat:@"%i",i] date:[NSDate date] isreaded:NO];
//    
//    i = 110;
//    
//    [[DBHelper sharedInstance] saveMsgFromID:[NSString stringWithFormat:@"%i",i] fromname:[NSString stringWithFormat:@"%i",i] fromheadurl:[NSString stringWithFormat:@"%i",i] msgtype:MsgTypeOther content:[NSString stringWithFormat:@"%i",i] date:[NSDate date] isreaded:NO];
    
    
    msgRecents = [[DBHelper sharedInstance]fetchMsgRecents];
    [self.tableView reloadData];
    
    
    
    //未读消息数量提示
    int unreadedMsgCount = [[DBHelper sharedInstance]getUnreadMsgNumber];
    if (unreadedMsgCount!=0) {
        
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%i",unreadedMsgCount];
    }else{
        
        self.tabBarItem.badgeValue = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (msgRecents) {
        
        return msgRecents.count;
    }
    return 0;
}

//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    if (indexPath.section == 0 && indexPath.row == 0) {
//        
//        return 80;
//    }else{
//        
//        return 45;
//    }
//    
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    static NSString *CellIdentifier = @"Tab2Cell";
    Tab2Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Tab2Cell"
                                              owner:self
                                            options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    
    
    MsgRecent * msg = [msgRecents objectAtIndex:indexPath.row];
    
    if (msg.newmsgcount<=0) {
        
        [cell.label_new removeFromSuperview];
        [cell.img_left_unread removeFromSuperview];
        
    }else{
        
        cell.label_new.text = [NSString stringWithFormat:@"%i",msg.newmsgcount.intValue];
        
    }
    
    switch (msg.type.intValue) {
        case MsgTypeLike:
        {
            
            [cell.label_content removeFromSuperview];
            [cell.label_title_top removeFromSuperview];
            
            cell.label_title_main.text = @"喜欢我";
            [cell.img_left_head setImage:[UIImage imageNamed:@"msg_like"]];
            
            break;
        }
        case MsgTypePairedUser:
        {
            
            [cell.label_content removeFromSuperview];
            [cell.label_title_top removeFromSuperview];
            
            cell.label_title_main.text = @"配对人发过来的消息";
            break;
        }
        case MsgTypePairRequire:
        {
            
            [cell.label_content removeFromSuperview];
            [cell.label_title_top removeFromSuperview];
            
            cell.label_title_main.text = @"配对请求";
            [cell.img_left_head setImage:[UIImage imageNamed:@"msg_pair_request"]];
            break;
        }
        case MsgTypeReply:
        {
            
            [cell.label_content removeFromSuperview];
            [cell.label_title_top removeFromSuperview];
            
            cell.label_title_main.text = @"回帖";
            [cell.img_left_head setImage:[UIImage imageNamed:@"msg_comments"]];
            break;
        }
        case MsgTypeSupport:
        {
            
            [cell.label_content removeFromSuperview];
            [cell.label_title_top removeFromSuperview];
            
            cell.label_title_main.text = @"赞";
            [cell.img_left_head setImage:[UIImage imageNamed:@"msg_good"]];
            break;
        }
        case MsgTypeSystem:
        {
            
            [cell.label_content removeFromSuperview];
            [cell.label_title_top removeFromSuperview];
            
            cell.label_title_main.text = @"系统消息";
            [cell.img_left_head setImage:[UIImage imageNamed:@"msg_system"]];
            break;
        }
        case MsgTypeVisit:
        {
            
            [cell.label_content removeFromSuperview];
            [cell.label_title_top removeFromSuperview];
            
            cell.label_title_main.text = @"最近访问";
            [cell.img_left_head setImage:[UIImage imageNamed:@"msg_visit"]];
            break;
        }
        case MsgTypeOther:
        {
            
            [cell.label_title_main removeFromSuperview];
            cell.label_content.text = msg.content;
            
            cell.label_title_top.text = msg.userid;
            
            break;
        }
        default:
            break;
    }
    
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
    
    
    MsgRecent * msg = [msgRecents objectAtIndex:indexPath.row];
    [[DBHelper sharedInstance] setMsgRecentReaded:msg];
    
    
    
    PostListVC * postListVC = [[PostListVC alloc]initWithNibName:@"PostListVC" bundle:nil];
    postListVC.postlistType = msg.type.intValue;
    [self.navigationController pushViewController:postListVC animated:YES];
    
}

@end
