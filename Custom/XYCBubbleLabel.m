//
//  XYCBubbleLabel.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-16.
//
//

#import "XYCBubbleLabel.h"
#import "XYCUtils.h"

@implementation XYCBubbleLabel

@synthesize label,maxWidth,isLeft;

#define paddingleftOrRight 20
#define paddingOther 10

-(id)init
{

    self = [super init];
    if (self) {
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        img_bg = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self addSubview:img_bg];
        
        label = [[UILabel alloc]initWithFrame:CGRectZero];
        [self addSubview:label];
        
    }
    return self;
}

- (void)redrawWithStartPoint:(CGPoint)startPoint
{
    
    CGSize size = [XYCUtils labelSizeFromStringContent:label.text fontSizeandLabelWidth:maxWidth andFontSize:label.font.pointSize];
    
    
    CGRect framelabel;
    CGRect frameimgbg;
    CGRect frame;

    
    //bg image
    if (isLeft) {
        
        frame = CGRectMake(startPoint.x, startPoint.y, size.width+paddingOther+paddingleftOrRight, size.height+2*paddingOther);
        framelabel = CGRectMake(paddingleftOrRight, paddingOther, size.width, size.height);
        frameimgbg = CGRectMake(0, 0, size.width+paddingOther+paddingleftOrRight, size.height+2*paddingOther);
        
        CGFloat top = 20; // 顶端盖高度
        CGFloat bottom = 20; // 底端盖高度
        CGFloat left = 40; // 左端盖宽度
        CGFloat right = 20; // 右端盖宽度
        UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
        // 指定为拉伸模式，伸缩后重新赋值
        [img_bg setImage:[[UIImage imageNamed:@"talk_qipao_left"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch]];
        
    }else{
        
        //是右边的话，startpoint就是最右边的位置
        
        frame = CGRectMake(startPoint.x-size.width-paddingleftOrRight-paddingOther, startPoint.y, size.width+paddingOther+paddingleftOrRight, size.height+2*paddingOther);
        framelabel = CGRectMake(paddingOther, paddingOther, size.width, size.height);
        frameimgbg = CGRectMake(0, 0, size.width+paddingOther+paddingleftOrRight, size.height+2*paddingOther);
        
        CGFloat top = 20; // 顶端盖高度
        CGFloat bottom = 20; // 底端盖高度
        CGFloat left = 20; // 左端盖宽度
        CGFloat right = 40; // 右端盖宽度
        UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
        // 指定为拉伸模式，伸缩后重新赋值
        [img_bg setImage:[[UIImage imageNamed:@"talk_qipao_right"] resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch]];
        
    }
    img_bg.frame = frameimgbg;
    
    //label
    label.frame = framelabel;
    
//    [self bringSubviewToFront:label];
    
    self.frame = frame;
    self.backgroundColor = [UIColor grayColor];
    
}


-(void)setFont:(UIFont*)textFont
{
    
    label.font = textFont;
}

-(void)setText:(NSString*)str
{
    
    label.text = str;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    
//	[label.text drawInRect:rect
//                 withFont:label.font
//            lineBreakMode:NSLineBreakByWordWrapping
//                alignment:NSTextAlignmentLeft];
    
}


@end
