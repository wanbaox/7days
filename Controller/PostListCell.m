//
//  PostListCell.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-19.
//
//

#import "PostListCell.h"
#import "UIViewExt.h"
#import "XYCUtils.h"

@implementation PostListCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = bgColor;
        
        self.label_title=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label_title.numberOfLines=0;
        self.label_title.font = [UIFont boldSystemFontOfSize:font_size_title];
        self.label_title.textColor = label_color_title;
        self.label_title.lineBreakMode=NSLineBreakByCharWrapping;
        self.label_title.backgroundColor=[UIColor clearColor];
        self.label_title.numberOfLines = 1;//最多显示一行文字
        [self addSubview:self.label_title];
        
        self.label_content=[[UILabel alloc]initWithFrame:CGRectZero];
        self.label_content.numberOfLines=0;
        self.label_content.font = [UIFont systemFontOfSize:font_size_content];
        self.label_content.textColor = label_color_content;
        self.label_content.lineBreakMode=NSLineBreakByCharWrapping;
        self.label_content.backgroundColor=[UIColor clearColor];
        self.label_content.numberOfLines = 3;//最多显示三行文字
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
        [self.img_content setContentMode:UIViewContentModeScaleAspectFill];//按比例缩放到最小的高或者宽
        [self.img_content setClipsToBounds:YES];//这样超出部分就会被截取掉
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
    
    
    self.img_head.frame = CGRectMake(padding_content_left, padding_content_Top, size4Head, size4Head);
    
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
    
    //img
    if(self.img_content.image){
        
        
        self.img_content.frame=CGRectMake(padding_bg_left+2, self.label_title.bottom+padding_item_level_0, 320-2*padding_bg_left-4, height_img_content);//图片
        
    }
    
    //content
    {
        
        CGFloat heightSingleLine = [XYCUtils labelHeigtFromStringContent:@"TEST" fontSizeandLabelWidth:320-2*padding_content_left andFontSize:font_size_content];
        
        CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_content.text fontSizeandLabelWidth:320-2*padding_content_left andFontSize:font_size_content];
        
        if (height>3*heightSingleLine) {
            
            height = 3*heightSingleLine;
        }
        
        if (self.img_content.image) {
            
            self.label_content.frame=CGRectMake(padding_content_left, self.img_content.bottom+padding_item_level_0, 320-2*padding_content_left, height);
            
        }else{
        
            self.label_content.frame=CGRectMake(padding_content_left, self.label_title.bottom+padding_item_level_0, 320-2*padding_content_left, height);
            
        }
        
    }
    
    //reply
    self.img_reply.frame = CGRectMake(320-self.img_reply.size.width-padding_content_left, self.label_content.bottom+padding_item_level_1, self.img_support.frame.size.width, height_button);
    
    //support
    self.img_support.frame = CGRectMake(self.img_reply.left-self.img_support.size.width-padding_bg_left, self.label_content.bottom+padding_item_level_1, self.img_support.frame.size.width, height_button);
    
    
    //bg img
    self.img_bg.frame = CGRectMake(padding_bg_left, padding_bg_Top, 320-2*padding_bg_left, self.img_support.size.height+self.img_support.origin.y);
    
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
