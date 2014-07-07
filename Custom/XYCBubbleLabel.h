//
//  XYCBubbleLabel.h
//  SevenDays
//
//  用于聊天界面里显示对话内容。可能还会包含表情图片等等
//
//  Created by 谢元潮 on 14-6-16.
//
//

#import <UIKit/UIKit.h>

@interface XYCBubbleLabel : UIView
{

    UIImageView * img_bg;//背景图片
    
}

@property (nonatomic, strong) UILabel * label;
@property (nonatomic) CGFloat maxWidth;//label的最大宽度
@property (nonatomic) BOOL isLeft;

/**
 *  根据内容重新设置尺寸
 */
- (void)redrawWithStartPoint:(CGPoint)startPoint;

-(void)setText:(NSString*)str;
-(void)setFont:(UIFont*)textFont;

@end
