//
//  TalkViewCell.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-16.
//
//

#import <UIKit/UIKit.h>
#import "XYCBubbleLabel.h"

@interface TalkViewCell : UITableViewCell

@property(nonatomic,retain) IBOutlet UIImageView *img_head_left;
@property(nonatomic,retain) IBOutlet UIImageView *img_head_right;
@property(nonatomic,retain) IBOutlet UILabel *label_date;
@property(nonatomic,retain) XYCBubbleLabel *label_content;

@end
