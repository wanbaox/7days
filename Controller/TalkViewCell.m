//
//  TalkViewCell.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-16.
//
//

#import "TalkViewCell.h"
#import "UIViewExt.h"

@implementation TalkViewCell

@synthesize label_date,img_head_left,img_head_right;

#define font_size_content 14
#define text_color_content [UIColor redColor]

- (void)awakeFromNib
{
    // Initialization code
    
    self.label_content=[[XYCBubbleLabel alloc]initWithFrame:CGRectZero];
    self.label_content.label.numberOfLines=0;
    self.label_content.label.font = [UIFont boldSystemFontOfSize:font_size_content];
    self.label_content.label.textColor = text_color_content;
    self.label_content.label.lineBreakMode=NSLineBreakByCharWrapping;
    self.label_content.backgroundColor=[UIColor clearColor];
    [self addSubview:self.label_content];
    
}

-(void)layoutSubviews{
    
    //content label
    if (self.label_content.isLeft) {
        
        
        [self.label_content redrawWithStartPoint:CGPointMake(self.img_head_left.right, self.label_date.bottom)];
    }else{
    
        
        [self.label_content redrawWithStartPoint:CGPointMake(self.img_head_right.left, self.label_date.bottom)];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
    [super setSelected:selected animated:animated];
    
}

@end
