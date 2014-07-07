//
//  XYCTableviewHeader.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-14.
//
//

#import "XYCTableviewHeader.h"
#import "UIViewExt.h"
#import "XYCUtils.h"

static CGFloat offset = 0;

@implementation XYCTableviewHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

-(id)initWithBGImage:(UIImage*)bgimg
{
    
    _heightNormal = bgimg.size.height-offset*2;
    CGRect frame = CGRectMake(0, -_heightNormal, bgimg.size.width, _heightNormal);
    self = [super initWithFrame:frame];
    if (self) {
        
        self.img_bg = [[UIImageView alloc]initWithImage:bgimg];
        self.img_bg.clipsToBounds = YES;
        [self.img_bg setContentMode:UIViewContentModeScaleAspectFill];
        self.img_bg.frame = CGRectMake(0, 0, self.img_bg.frame.size.width, _heightNormal);
        
        [self addSubview:self.img_bg];
        
        //状态切换用
        self.img_devil = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_detail_devil"]];
        self.img_devil.clipsToBounds = YES;
        [self.img_devil setContentMode:UIViewContentModeScaleAspectFill];
        self.img_devil.center = CGPointMake(self.frame.size.width-self.img_devil.frame.size.width/2-20, 20+self.img_devil.frame.size.height/2);
        [self addSubview:self.img_devil];
        
        self.img_head = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_detail_head_bg"]];
        self.img_head.clipsToBounds = YES;
        [self.img_head setContentMode:UIViewContentModeScaleAspectFill];
        self.img_head.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        [self addSubview:self.img_head];
        
        
        self.label_name = [[UILabel alloc]initWithFrame:CGRectZero];
        self.label_name.text = @"WAN_WAN_";
//        self.label_name.center = CGPointMake(self.frame.size.width/2, self.img_head.bottom+50);
        
        self.label_name.numberOfLines=0;
        self.label_name.font = [UIFont systemFontOfSize:16];
        self.label_name.textColor = [UIColor whiteColor];
        self.label_name.lineBreakMode=NSLineBreakByCharWrapping;
        self.label_name.backgroundColor=[UIColor clearColor];
        
        [self addSubview:self.label_name];
        
        CGSize size = [XYCUtils labelSizeFromStringContent:self.label_name.text fontSizeandLabelWidth:320 andFontSize:16];
        self.label_name.frame = CGRectMake(160-size.width/2, self.img_head.bottom+4, size.width, size.height);
        
        
        
        
        self.img_gender = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"gender_male"]];
        self.img_gender.clipsToBounds = YES;
        [self.img_gender setContentMode:UIViewContentModeScaleAspectFill];
        self.img_gender.center = CGPointMake(self.label_name.right, self.label_name.center.y);
        [self addSubview:self.img_gender];
        
        
    }
    return self;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void)reDraw:(UIScrollView *)scrollView{
    
    CGFloat yOffset  = scrollView.contentOffset.y;
    
    if (yOffset < -_heightNormal-20) {  // 20 状态栏的高度
        
        CGRect f = self.img_bg.frame;
        f.origin.y = yOffset+_heightNormal;
        f.size.height =  -yOffset;
        self.img_bg.frame = f;
        
    }
    
}


@end
