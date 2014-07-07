//
//  TalkInputBar.h
//  SevenDays
//
//  聊天界面中，底部的输入框，包括输入框，smile等按钮，已经处理了各种键盘事件
//
//  Created by 谢元潮 on 14-6-19.
//
//

#import <UIKit/UIKit.h>


//bar的一些代理
@protocol XYCTalkInputBarDelegate
@optional
/**
 *  键盘（笑脸bar等等）隐藏，从底部开始，hightVisibleFromBottom高度可见
 */
-(void)keyboardHided:(CGFloat)hightVisibleFromBottom;
-(void)keyboardShowed:(CGPoint)barPosition;//显示键盘

@end


typedef enum {
    
    ShowBannerNull = 1,//不现实任何banner
    ShowBannerSmile,//显示smile banner
    ShowBannerMore,//more
    
} ShowBanner;

#define animationDuring 0.25
#define keyboardHeight 216    //普通键盘的高度

@interface XYCTalkInputBar : UIView
{

//    UIImageView * img_bg;
    UITextField * textField;
    UIButton * btn_smile;
    UIButton * btn_keyboard;
    UIButton * btn_audio;
    UIButton * btn_more;
    
    UIView * view_smile_bg;
    
    ShowBanner showBanner;
    
    CGRect originFrame;
    
}

@property (nonatomic, strong) NSObject<XYCTalkInputBarDelegate> * delegate;

-(ShowBanner)getShowBanner;

-(void)endInput;

-(NSString*)getContentStr;

/**
 *  输入框获取到焦点
 */
-(void)startInput;

@end



