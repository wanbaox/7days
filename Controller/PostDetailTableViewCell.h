//
//  PostDetailTableViewCell.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-11.
//
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface PostDetailTableViewCell : UITableViewCell

#define padding_bg_left 15           //背景左右边距
//#define padding_content_left 17     //内容左右边距
#define padding_bg_Top 15           //背景上下边距
//#define padding_content_Top 22      //内容上下边距

//#define img_content_size 100                //内容中图片点尺寸

#define padding_item_level_0 5             //item之间点间距
#define padding_item_level_1 15             //item之间点间距

#define size4Head 30  //头像尺寸

#define font_size_name 14
#define font_size_date 12
#define font_size_content 16
#define font_size_title 18

#define label_color_title [UIColor blackColor]
#define label_color_content [UIColor grayColor]
#define label_color_date [UIColor grayColor]
#define label_color_name [UIColor blackColor]

//@property(nonatomic,retain) IBOutlet UILabel *label_content;
//@property(nonatomic,retain) IBOutlet UIImageView *img_heart;

@property (strong,nonatomic) UILabel *label_date;
@property (strong,nonatomic) UILabel *label_name;
@property (strong,nonatomic) UILabel *label_title;
@property (strong,nonatomic) UILabel *label_content;
//@property (strong,nonatomic) UIImageView *img_bg;
@property (strong,nonatomic) NSMutableArray *imgs;
@property (strong,nonatomic) UIImageView *img_head;
//@property (nonatomic) BOOL showTitle;   //是否需要显示标题
//@property (nonatomic) BOOL isReply;     //是否是回复
//@property (strong,nonatomic) NSArray * imgdatas;

//@property (strong,nonatomic) UIImageView *img_reply;
//@property (strong,nonatomic) UIImageView *img_support;
@property (strong,nonatomic) Post *post;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier post:(Post*)post;

@end
