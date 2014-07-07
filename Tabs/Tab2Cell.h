//
//  Tab2Cell.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-17.
//
//

#import <UIKit/UIKit.h>

@interface Tab2Cell : UITableViewCell

@property(nonatomic,retain) IBOutlet UIImageView *img_left_head;
@property(nonatomic,retain) IBOutlet UIImageView *img_left_unread;
@property(nonatomic,retain) IBOutlet UILabel *label_new;
@property(nonatomic,retain) IBOutlet UILabel *label_title_main;
@property(nonatomic,retain) IBOutlet UILabel *label_title_top;
@property(nonatomic,retain) IBOutlet UILabel *label_content;

@end
