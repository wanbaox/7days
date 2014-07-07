//
//  XYCTableviewHeader.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-14.
//
//

#import <UIKit/UIKit.h>

@interface XYCTableviewHeader : UIView

@property (nonatomic, strong) UIImageView *img_bg;
@property (nonatomic, strong) UIImageView *img_head;
@property (nonatomic, strong) UIImageView *img_gender;
@property (nonatomic, strong) UIImageView *img_devil;

@property (nonatomic, strong) UILabel *label_name;


@property (nonatomic) CGFloat heightNormal;//不滑动的情况下显示的图片高度

-(id)initWithBGImage:(UIImage*)bgimg;

- (void)reDraw:(UIScrollView *)scrollView;

@end
