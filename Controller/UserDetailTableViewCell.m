//
//  UserDetailTableViewCell.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-15.
//
//

#import "UserDetailTableViewCell.h"
#import "UIViewExt.h"
#import "XYCUtils.h"

@implementation UserDetailTableViewCell

#define padding_bg_left 7           //背景左右边距
#define padding_content_left 17     //内容左右边距
#define padding_bg_Top 10           //背景上下边距
#define padding_content_Top 22      //内容上下边距

#define img_content_size 100                //内容中图片点尺寸

#define padding_item_level_0 5             //item之间点间距
#define padding_item_level_1 15             //item之间点间距

#define font_size_name 14
#define font_size_date 12
#define font_size_content 16
#define font_size_title 18

#define label_color_title [UIColor blackColor]
#define label_color_content [UIColor grayColor]
#define label_color_date [UIColor grayColor]
#define label_color_name [UIColor blackColor]

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.label_title=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label_title.numberOfLines=0;
        self.label_title.font = [UIFont boldSystemFontOfSize:font_size_title];
        self.label_title.textColor = label_color_title;
        self.label_title.lineBreakMode=NSLineBreakByCharWrapping;
        self.label_title.backgroundColor=[UIColor clearColor];
        [self addSubview:self.label_title];
        
        self.label_content=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label_content.numberOfLines=0;
        self.label_content.font = [UIFont systemFontOfSize:font_size_content];
        self.label_content.textColor = label_color_content;
        self.label_content.lineBreakMode=NSLineBreakByCharWrapping;
        self.label_content.backgroundColor=[UIColor clearColor];
        [self addSubview:self.label_content];
        
        self.label_name=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label_name.numberOfLines=0;
        self.label_name.font = [UIFont systemFontOfSize:font_size_name];
        self.label_name.textColor = label_color_name;
        self.label_name.lineBreakMode=NSLineBreakByCharWrapping;
        self.label_name.backgroundColor=[UIColor clearColor];
        [self addSubview:self.label_name];
        
        self.label_date=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label_date.numberOfLines=0;
        self.label_date.font = [UIFont systemFontOfSize:font_size_date];
        self.label_date.textColor = label_color_date;
        self.label_date.lineBreakMode=NSLineBreakByCharWrapping;
        self.label_date.backgroundColor=[UIColor clearColor];
        [self addSubview:self.label_date];
        
        self.img_content=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.img_content];
        
        self.img_support=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_support"]];
        [self addSubview:self.img_support];
        
        self.img_reply=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_reply"]];
        [self addSubview:self.img_reply];
        
        self.img_bg=[[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:self.img_bg];
        
        self.img_head=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_tableview_content_head"]];
        [self addSubview:self.img_head];
        
    }
    
    return self;
}

-(void)layoutSubviews{
    
    
    self.img_head.frame = CGRectMake(padding_content_left, padding_content_Top, self.img_head.frame.size.width, self.img_head.frame.size.height);
    
    //name
    {
        
        CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_name.text fontSizeandLabelWidth:320-self.img_head.right-padding_content_left-padding_item_level_0 andFontSize:font_size_name];
        self.label_name.frame = CGRectMake(self.img_head.right+padding_item_level_0, padding_content_Top-2, 320-self.img_head.right-padding_content_left-padding_item_level_0, height);
        
    }
    
    //date
    {
        
        
        
        CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_date.text fontSizeandLabelWidth:320-self.img_head.right-padding_content_left-padding_item_level_0 andFontSize:font_size_date];
        self.label_date.frame = CGRectMake(self.img_head.right+padding_item_level_0, self.img_head.bottom-height+2, 320-self.img_head.right-padding_content_left-padding_item_level_0, height);
        
    }
    
    //title
    {
        
        CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_title.text fontSizeandLabelWidth:320-2*padding_content_left andFontSize:font_size_title];
        self.label_title.frame=CGRectMake(padding_content_left, self.img_head.bottom+padding_item_level_1, 320-2*padding_content_left, height);
        
    }
    
    //content
    {
        
        CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_content.text fontSizeandLabelWidth:320-2*padding_content_left andFontSize:font_size_content];
        self.label_content.frame=CGRectMake(padding_content_left, self.label_title.bottom+padding_item_level_0, 320-2*padding_content_left, height);
        
    }
    
    
    if(self.img_content.image)
        self.img_content.frame=CGRectMake(padding_content_left, self.label_content.bottom+padding_item_level_0, img_content_size, img_content_size);//图片
    
    self.img_reply.frame = CGRectMake(320-self.img_reply.size.width-padding_content_left, self.img_content.bottom+padding_item_level_1, self.img_support.frame.size.width, self.img_support.frame.size.height);
    
    self.img_support.frame = CGRectMake(self.img_reply.left-self.img_support.size.width-padding_bg_left, self.img_content.bottom+padding_item_level_1, self.img_support.frame.size.width, self.img_support.frame.size.height);
    
    self.img_bg.frame = CGRectMake(padding_bg_left, padding_bg_Top, 320-2*padding_bg_left, self.img_reply.size.height+self.img_reply.origin.y);
    CGFloat top = 25;       // 顶端盖高度
    CGFloat bottom = 25;    // 底端盖高度
    CGFloat left = 25;      // 左端盖宽度
    CGFloat right = 25;     // 右端盖宽度
    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
    [self.img_bg setImage:[[UIImage imageNamed:@"bg_tableview_content_card"]resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch]];
    
    
    [self bringSubviewToFront:self.label_title];
    [self bringSubviewToFront:self.label_content];
    [self bringSubviewToFront:self.label_date];
    [self bringSubviewToFront:self.label_name];
    [self bringSubviewToFront:self.img_head];
    [self bringSubviewToFront:self.img_content];
    [self bringSubviewToFront:self.img_support];
    [self bringSubviewToFront:self.img_reply];
    
}

//- (CGFloat)labelHeight:(NSString *)content fontSize:(CGFloat)fontSize
//{
//    CGFloat height = [self labelHeigtFromStringContent:content fontSizeandLabelWidth:280 andFontSize:fontSize];
//
//    return height;
//
//}
//
//- (CGFloat)heightContentBackgroundView:(NSString *)content fontSize:(CGFloat)fontSize
//{
//    CGFloat height = [self labelHeigtFromStringContent:content fontSizeandLabelWidth:280 andFontSize:fontSize];
//
//    return height;
//
//}
//
//- (CGFloat)labelHeigtFromStringContent:(NSString *)text fontSizeandLabelWidth:(CGFloat)width andFontSize:(CGFloat)fontSize
//{
//
//    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, 20000)];
//    return size.height;
//}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];
    
}

@end