//
//  UserDetailTableViewCell.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-15.
//
//

#import <UIKit/UIKit.h>

@interface UserDetailTableViewCell : UITableViewCell

@property (strong,nonatomic) UILabel *label_date;
@property (strong,nonatomic) UILabel *label_name;
@property (strong,nonatomic) UILabel *label_title;
@property (strong,nonatomic) UILabel *label_content;
@property (strong,nonatomic) UIImageView *img_bg;
@property (strong,nonatomic) UIImageView *img_content;//内容中的一张图片
@property (strong,nonatomic) UIImageView *img_head;
@property (strong,nonatomic) UIImageView *img_reply;
@property (strong,nonatomic) UIImageView *img_support;

@end
