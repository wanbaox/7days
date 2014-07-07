//
//  TAB3ViewController.m
//  HelloWorld
//
//  Created by 谢元潮 on 14-4-10.
//
//

#import "TAB3ViewController.h"
#import "Tab3Cell.h"

@interface TAB3ViewController ()

@end

@implementation TAB3ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"发现";
        
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:self.title image:[UIImage imageNamed:@"tab2.png"] selectedImage:[UIImage imageNamed:@"tab2_selected.png"]];
        
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//    if (section == 0) {
//        
//        return 20.0;
//    }else{
//        
//        return 0;
//    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    switch (section) {
        case 0:
            
            return 2;
            break;
        case 1:
            
            return 3;
            break;
        case 2:
            
            return 4;
            break;
            
        default:
            break;
    }
    return 10;
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
    
    static NSString *CellIdentifier = @"Tab3Cell";
    Tab3Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"Tab3Cell"
                                              owner:self
                                            options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleBlue;
        
    }
    
    switch (indexPath.section) {
        case 0:
        {
            switch (indexPath.row) {
                case 0:
                    cell.label_title.text = @"热门话题";
                    break;
                case 1:
                    cell.label_title.text = @"热门图片";
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
                    cell.label_title.text = @"分享音乐/书";
                    break;
                case 1:
                    cell.label_title.text = @"分享电影";
                    break;
                case 2:
                    cell.label_title.text = @"优语录";
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
                    cell.label_title.text = @"奢侈品";
                    break;
                case 1:
                    cell.label_title.text = @"衣服裤子";
                    break;
                case 2:
                    cell.label_title.text = @"包包";
                    break;
                case 3:
                    cell.label_title.text = @"鞋子";
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
