//
//  PostDetailTableViewCell.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-11.
//
//

#import "PostDetailTableViewCell.h"
#import "UIViewExt.h"
#import "XYCUtils.h"
#import "ImgData.h"

@implementation PostDetailTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier post:(Post*)post
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.post = post;
        
        if (self.post.title && self.post.title.length>0) {
            
            self.label_title=[[UILabel alloc]initWithFrame:CGRectZero];
            self.label_title.numberOfLines=0;
            self.label_title.font = [UIFont boldSystemFontOfSize:font_size_title];
            self.label_title.textColor = label_color_title;
            self.label_title.lineBreakMode=NSLineBreakByCharWrapping;
            self.label_title.backgroundColor=[UIColor clearColor];
            [self addSubview:self.label_title];
        }
        
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
        
        self.imgs = [[NSMutableArray alloc]init];
        UIImageView * img_content;
        for (ImgData * imgdata in self.post.imgs) {
            
            img_content=[[UIImageView alloc]initWithFrame:CGRectZero];
            [img_content setContentMode:UIViewContentModeScaleAspectFill];//按比例缩放到最小的高或者宽
            [img_content setClipsToBounds:YES];//这样超出部分就会被截取掉
            img_content.tag = imgdata.imgID;
            
            [self addSubview:img_content];
            [self.imgs addObject:img_content];
            
        }
        
//        self.img_support=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_support"]];
//        [self addSubview:self.img_support];
//        
//        self.img_reply=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_reply"]];
//        [self addSubview:self.img_reply];
//        
//        self.img_bg=[[UIImageView alloc]initWithFrame:CGRectZero];
//        [self addSubview:self.img_bg];
        
        self.img_head=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_tableview_content_head"]];
        [self addSubview:self.img_head];
        
        
    }
    
    return self;
}

-(void)layoutSubviews{
    
    NSLog(@"layout img count:%i",self.imgs.count);
    self.img_head.frame = CGRectMake(padding_bg_left, padding_bg_Top, size4Head, size4Head);
    
    //name
    {
        
        CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_name.text fontSizeandLabelWidth:320-self.img_head.right-padding_bg_left-padding_item_level_0 andFontSize:font_size_name];
        self.label_name.frame = CGRectMake(self.img_head.right+padding_item_level_0, padding_bg_Top-2, 320-self.img_head.right-padding_bg_left-padding_item_level_0, height);
        
    }
    
    //date
    {
        
        
        
        CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_date.text fontSizeandLabelWidth:320-self.img_head.right-padding_bg_left-padding_item_level_0 andFontSize:font_size_date];
        self.label_date.frame = CGRectMake(self.img_head.right+padding_item_level_0, self.img_head.bottom-height+2, 320-self.img_head.right-padding_bg_left-padding_item_level_0, height);
        
    }
    
    //title
    {
        
        if (self.post.title && self.post.title.length>0) {
            
            CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_title.text fontSizeandLabelWidth:320-2*padding_bg_left andFontSize:font_size_title];
            self.label_title.frame=CGRectMake(padding_bg_left, self.img_head.bottom+padding_item_level_1, 320-2*padding_bg_left, height);
        }
        
    }
    
    //content
    {
        if (self.post.title && self.post.title.length>0) {
            
            CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_content.text fontSizeandLabelWidth:320-2*padding_bg_left andFontSize:font_size_content];
            self.label_content.frame=CGRectMake(padding_bg_left, self.label_title.bottom+padding_item_level_0, 320-2*padding_bg_left, height);
        }else{
            
            CGFloat height = [XYCUtils labelHeigtFromStringContent:self.label_content.text fontSizeandLabelWidth:320-2*padding_bg_left andFontSize:font_size_content];
            self.label_content.frame=CGRectMake(padding_bg_left, self.img_head.bottom+padding_item_level_0, 320-2*padding_bg_left, height);
        }
        
    }
    
    //图片，可能会有好多张图片
    UIImageView * img_pre;//前一张图片
    
    for (UIImageView *img in self.imgs) {
        
        CGFloat imgHeight;
        CGFloat imgWidth;
        CGFloat startX;
        
        if (self.post.postType != PostType_reply) {
            
            //主题/吐槽
            imgWidth = [XYCUtils screenFrame].size.width-2*padding_bg_left;
            startX = padding_bg_left;
        }else{
            
            //回复
            imgWidth = [XYCUtils screenFrame].size.width-self.img_head.right-padding_bg_left-padding_item_level_0;
            startX = self.img_head.right + padding_item_level_0;
        }
        
        imgHeight = imgWidth*[self fetchImgDataByID:img.tag].ratio;
        
        if (img_pre) {
            
            img.frame=CGRectMake(startX , img_pre.bottom+padding_item_level_0, imgWidth, imgHeight);//图片
            
        }else{
            
            img.frame=CGRectMake(startX , self.label_content.bottom+padding_item_level_0, imgWidth, imgHeight);//图片
            
        }
        
        [self bringSubviewToFront:img];
        
        img_pre = img;
        
    }
    
//    if(self.img_content.image)
//    {
//        CGFloat imgHeight;
//        CGFloat imgWidth;
//        CGFloat startX;
//        
//        if (!self.isReply) {
//            
//            imgWidth = [XYCUtils screenFrame].size.width-2*padding_bg_left;
//            startX = padding_bg_left;
//        }else{
//            
//            imgWidth = [XYCUtils screenFrame].size.width-2*padding_bg_left-self.img_head.frame.size.width;
//            startX = padding_bg_left + self.img_head.frame.size.width;
//        }
//        
//        imgHeight = imgWidth*self.img_content.image.size.height/self.img_content.image.size.width;
//        
//        self.img_content.frame=CGRectMake(startX , self.label_content.bottom+padding_item_level_0, imgWidth, imgHeight);//图片
//        
//    }
   
//    self.img_reply.frame = CGRectMake(320-self.img_reply.size.width-padding_bg_left, self.img_content.bottom+padding_item_level_1, self.img_support.frame.size.width, self.img_support.frame.size.height);
//    
//    self.img_support.frame = CGRectMake(self.img_reply.left-self.img_support.size.width-padding_bg_left, self.img_content.bottom+padding_item_level_1, self.img_support.frame.size.width, self.img_support.frame.size.height);
    
    
    //背景图片
//    if(self.img_content.image)
//    {
//        
//        self.img_bg.frame = CGRectMake(padding_bg_left, padding_bg_Top, 320-2*padding_bg_left, self.img_content.size.height+self.img_content.origin.y);
//    }else{
//    
//        self.img_bg.frame = CGRectMake(padding_bg_left, padding_bg_Top, 320-2*padding_bg_left, self.label_content.size.height+self.label_content.origin.y);
//    }
//    
//    CGFloat top = 25;       // 顶端盖高度
//    CGFloat bottom = 25;    // 底端盖高度
//    CGFloat left = 25;      // 左端盖宽度
//    CGFloat right = 25;     // 右端盖宽度
//    UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
//    [self.img_bg setImage:[[UIImage imageNamed:@"bg_tableview_bg_card"]resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch]];
    
    
    [self bringSubviewToFront:self.label_title];
    [self bringSubviewToFront:self.label_content];
    [self bringSubviewToFront:self.label_date];
    [self bringSubviewToFront:self.label_name];
    [self bringSubviewToFront:self.img_head];
//    [self bringSubviewToFront:self.img_support];
//    [self bringSubviewToFront:self.img_reply];

    
//    self.frame = CGRectMake(0, 0, [XYCUtils screenFrame].size.width, self.img_bg.frame.origin.y+self.img_bg.frame.size.height);
    
//    NSLog(@"layout suvviews :%@",NSStringFromCGRect(self.frame));
}

-(ImgData*)fetchImgDataByID:(NSInteger)imgID
{
    

    for (ImgData * imgData in self.post.imgs) {
        
        if (imgID == imgData.imgID) {
            
            return imgData;
        }
    }
    
    return nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];
    
}


@end
