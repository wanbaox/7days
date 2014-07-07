//
//  TAB4ViewController.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-13.
//
//

#import "TAB4ViewController.h"
#import "Tab4Cell.h"
#import "UserDetailViewController.h"
#import "SettingViewController.h"

@interface TAB4ViewController ()

@end

@implementation TAB4ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"我";
        
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:self.title image:[UIImage imageNamed:@"tab3.png"] selectedImage:[UIImage imageNamed:@"tab3_selected.png"]];
        
        //右边按钮
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
        
    }
    return self;
}


-(void)rightAction:(id)sender
{
    
    [self.navigationController pushViewController:[[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil] animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)viewWillAppear:(BOOL)animated
{    
    
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source


//定义section之间的距离，也包括最顶上的section header的高度
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section

{
    if (section == 0) {
        
        return 10.0;
    }else{
        
        return 0.01;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 10.0;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            
            return 1;
            break;
        case 1:
            
            return 2;
            break;
        case 2:
            
            return 3;
            break;
        case 3:
            
            return 3;
            break;
            
        default:
            break;
    }
    
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.section == 0 && indexPath.row == 0) {
        
        return 80;
    }else{
    
        return 45;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    static NSString *CellIdentifier = @"Tab4Cell";
    Tab4Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Tab4Cell"
                                              owner:self
                                            options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    
    [cell.img_head setHidden:YES];
    [cell.label_name setHidden:YES];
    [cell.label_info setHidden:YES];
    
    switch (indexPath.section) {
        case 0:
            
            [cell.img_left_ic setHidden:YES];
            [cell.label_content setHidden:YES];
            
            [cell.img_head setHidden:NO];
            [cell.label_name setHidden:NO];
            [cell.label_info setHidden:NO];
            
            
            
            break;
        case 1:
            
            switch (indexPath.row) {
                case 0:
                    
                    cell.label_content.text = @"配对记录(10)";
                    break;
                case 1:
                    
                    cell.label_content.text = @"配对请求(2)";
                    break;
                    
                default:
                    break;
            }
            break;
        case 2:
            
            switch (indexPath.row) {
                case 0:
                    
                    cell.label_content.text = @"（被）喜欢";
                    break;
                    
                case 1:
                    
                    cell.label_content.text = @"（被）关注";
                    break;
                    
                case 2:
                    
                    cell.label_content.text = @"（被）赞";
                    break;
                    
                case 3:
                    
                    cell.label_content.text = @"(被)收藏";
                    break;
                    
                default:
                    break;
            }
            
            
            
            
            break;
        case 3:
            
            switch (indexPath.row) {
                case 0:
                    
                    cell.label_content.text = @"回复";
                    break;
                case 1:
                    
                    cell.label_content.text = @"相册";
                    break;
                case 2:
                    
                    cell.label_content.text = @"相册";
                    break;
                    
                default:
                    break;
            }
            break;
            
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

    switch (indexPath.section) {
        case 0:
        {
            
            switch (indexPath.row) {
                case 0:
                {
                    
//                    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"ic_reply"] forBarMetrics:UIBarMetricsDefault];
//                    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
                    
//                    [self.navigationController.navigationBar setTranslucent:YES];
//
//                    [self.navigationController.navigationBar setAlpha:0];//这个可以让导航栏变透明
//                    
//                    [self.navigationController setNavigationBarHidden:YES animated:YES];
                    [self.navigationController pushViewController:[[UserDetailViewController alloc]initWithNibName:@"UserDetailViewController" bundle:nil] animated:YES];
                    
                    break;
                }
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
}


@end
