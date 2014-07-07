//
//  PostListCell.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-19.
//
//

#import <UIKit/UIKit.h>

@interface PostListCell : UITableViewCell


#define padding_bg_left 7           //背景左右边距
#define padding_content_left 17     //内容左右边距
#define padding_bg_Top 10           //背景上下边距
#define padding_content_Top 22      //内容上下边距

#define img_content_size 100                //内容中图片点尺寸

#define padding_item_level_0 5             //item之间点间距
#define padding_item_level_1 15             //item之间点间距

#define height_img_content 180      //图片的高度
#define height_button 30      //赞按钮的高度
#define size4Head 30

#define font_size_name 14
#define font_size_date 12
#define font_size_content 16
#define font_size_title 18

#define label_color_title [UIColor blackColor]
#define label_color_content [UIColor grayColor]
#define label_color_date [UIColor grayColor]
#define label_color_name [UIColor blackColor]

#define bgColor [UIColor lightGrayColor]    //背景色


@property (strong,nonatomic) UILabel *label_date;
@property (strong,nonatomic) UILabel *label_name;
@property (strong,nonatomic) UILabel *label_title;
@property (strong,nonatomic) UILabel *label_content;
@property (strong,nonatomic) UIImageView *img_bg;
@property (strong,nonatomic) UIImageView *img_content;//内容中的一张图片
@property (strong,nonatomic) UIImageView *img_head;
@property (strong,nonatomic) UIImageView *img_support;
@property (strong,nonatomic) UIImageView *img_reply;

@end
