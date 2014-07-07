//
//  SettingViewController.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-16.
//
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
            
            return 3;
            break;
            
        case 2:
            
            return 2;
            break;
            
        case 3:
            
            return 1;
            break;
            
        default:
            break;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static  NSString *cellIn=@"settingcell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIn];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIn];
    }
    
    
    switch (indexPath.section) {
        case 0:
        {
        
            switch (indexPath.row) {
                case 0:
                    
                    cell.textLabel.text=@"账户管理";
                    break;
                    
                default:
                    break;
            }
            break;
        }
            
        case 1:
        {
            
            switch (indexPath.row) {
                case 0:
                    
                    cell.textLabel.text=@"通知和提醒";
                    break;
                    
                case 1:
                    
                    cell.textLabel.text=@"通用设置";
                    break;
                    
                case 2:
                    
                    cell.textLabel.text=@"隐私与安全";
                    break;
                    
                default:
                    break;
            }
            break;
        }
            
        case 2:
        {
            
            switch (indexPath.row) {
                case 0:
                    
                    cell.textLabel.text=@"意见反馈";
                    break;
                    
                case 1:
                    
                    cell.textLabel.text=@"关于";
                    break;
                    
                default:
                    break;
            }
            break;
        }
            
        case 3:
        {
            
            switch (indexPath.row) {
                case 0:
                    
                    cell.textLabel.text=@"退出当前账号";
                    break;
                    
                default:
                    break;
            }
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
