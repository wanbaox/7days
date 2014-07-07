//
//  TalkInputBar.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-19.
//
//

#import "XYCTalkInputBar.h"
#import "UIViewExt.h"
#import "XYCUtils.h"

@implementation XYCTalkInputBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        originFrame = frame;
        showBanner = ShowBannerNull;
        
        btn_audio = [[UIButton alloc]initWithFrame:CGRectMake(textField.right+8, (frame.size.height-25)/2, 25, 25)];
        [btn_audio setImage:[UIImage imageNamed:@"talk_bar_btn_record_audio"] forState:UIControlStateNormal];
        [self addSubview:btn_audio];
        
        textField = [[UITextField alloc]initWithFrame:CGRectMake(btn_audio.right+8, (frame.size.height-30)/2, 200, 30)];
        textField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:textField];
        
        btn_smile = [[UIButton alloc]initWithFrame:CGRectMake(textField.right+8, (frame.size.height-25)/2, 25, 25)];
        [btn_smile setImage:[UIImage imageNamed:@"talk_bar_btn_smile"] forState:UIControlStateNormal];
        [self addSubview:btn_smile];
        [btn_smile addTarget:self action:@selector(smileBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        btn_more = [[UIButton alloc]initWithFrame:CGRectMake(btn_smile.right+8, (frame.size.height-25)/2, 25, 25)];
        [btn_more setImage:[UIImage imageNamed:@"talk_bar_btn_more"] forState:UIControlStateNormal];
        [self addSubview:btn_more];
        
        btn_keyboard = [[UIButton alloc]initWithFrame:btn_more.frame];
        [btn_keyboard setImage:[UIImage imageNamed:@"talk_bar_btn_keyboard"] forState:UIControlStateNormal];
        [self addSubview:btn_keyboard];
        btn_keyboard.alpha = 0;
        [btn_keyboard addTarget:self action:@selector(keyboardBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self initKeyboardEvent];//初始化键盘事件
        
        
        //smile bg
        view_smile_bg = [[UIView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, keyboardHeight)];
        view_smile_bg.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:view_smile_bg];
        
        
        self.backgroundColor = [UIColor lightGrayColor];
        
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


#pragma mark 键盘事件

- (void)initKeyboardEvent {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputKeyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputKeyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}

//- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
//    
//    showBanner = ShowBannerNull;
//    //此method会将self.view里所有的subview的first responder都resign掉
//    [self endEditing:YES];
//    
//}



#pragma mark 监听键盘的显示
-(void)inputKeyboardWillShow:(NSNotification *)notification{
    
    //显示键盘
    CGFloat animationTime = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    switch (showBanner) {
        case ShowBannerNull:
        {
            
            break;
        }
        case ShowBannerSmile:
        {
            btn_keyboard.alpha = 0;
            btn_smile.alpha = 1;
            break;
        }
        case ShowBannerMore:
        {
            
            break;
        }
        default:
            break;
    }
    
    showBanner = ShowBannerNull;
    
    [UIView animateWithDuration:animationTime animations:^{
        CGRect keyBoardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        
        
        self.frame = CGRectMake(0, keyBoardFrame.origin.y-originFrame.size.height, self.bounds.size.width,originFrame.size.height);
        
        [_delegate keyboardShowed:self.frame.origin];
        
    }];
    
}

-(void)inputKeyboardWillHide:(NSNotification *)notification{
    
    //键盘dismiss，设置toolbar的frame跟随键盘的frame
    CGFloat animationTime = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    switch (showBanner) {
        case ShowBannerNull:
        {
            btn_keyboard.alpha = 0;
            btn_smile.alpha = 1;
            
            [UIView animateWithDuration:animationTime animations:^{
                
                //隐藏键盘，隐藏smile，
                CGRect frame = [XYCUtils screenFrame];
                self.frame = originFrame;
                view_smile_bg.frame = CGRectMake(0, frame.origin.y+frame.size.height, view_smile_bg.size.width, view_smile_bg.size.height);
                
                [_delegate keyboardHided:frame.size.height-originFrame.origin.y];
                
            }];
            
            break;
        }
        case ShowBannerSmile:
        {
            
            btn_smile.alpha = 0;
            btn_keyboard.alpha = 1;
            btn_keyboard.frame = btn_smile.frame;
            
            [UIView animateWithDuration:animationTime animations:^{
                
                //隐藏键盘，显示smile
                
                CGRect frame = [XYCUtils screenFrame];
                
                self.frame = CGRectMake(0, frame.size.height-keyboardHeight-self.frame.size.height, self.bounds.size.width,self.frame.size.height+keyboardHeight);
                
                view_smile_bg.frame = CGRectMake(0, self.frame.size.height-keyboardHeight, view_smile_bg.size.width, view_smile_bg.size.height);
                
                [_delegate keyboardShowed:self.frame.origin];
            }];
            
            break;
        }
        case ShowBannerMore:
        {
            
            
            break;
        }
        default:
            break;
    }
    
    
}

-(void)keyboardBtnClicked:(id)sender
{
    
    [textField becomeFirstResponder];
    
}

-(void)smileBtnClicked:(id)sender
{
    
    if (showBanner!=ShowBannerNull) {
        
        //键盘没有显示
        
        //显示smile
        showBanner = ShowBannerSmile;
        
        btn_smile.alpha = 0;
        btn_keyboard.alpha = 1;
        btn_keyboard.frame = btn_smile.frame;
        
        [UIView animateWithDuration:animationDuring animations:^{
            
            CGRect frame = [XYCUtils screenFrame];
            
            self.frame = CGRectMake(0, frame.size.height-keyboardHeight-self.frame.size.height, self.bounds.size.width,self.frame.size.height+keyboardHeight);
            
            view_smile_bg.frame = CGRectMake(0, self.frame.size.height-keyboardHeight, view_smile_bg.size.width, view_smile_bg.size.height);
            
            
            [_delegate keyboardShowed:self.frame.origin];
            
        }];
        
        
    }else{
        
        //键盘已经显示
        //隐藏键盘，显示smile
        showBanner = ShowBannerSmile;
        
        [self endEditing:YES];
        
    }
    
}

-(ShowBanner)getShowBanner
{

    return showBanner;
}

-(void)endInput
{

    [UIView animateWithDuration:animationDuring animations:^{
        
        
        btn_smile.alpha = 1;
        btn_keyboard.alpha = 0;
        
        CGRect frame = [XYCUtils screenFrame];
        self.frame = originFrame;
        view_smile_bg.frame = CGRectMake(0, frame.origin.y+frame.size.height, view_smile_bg.size.width, view_smile_bg.size.height);
        
    }];
    
}

-(NSString*)getContentStr
{

    return textField.text;
}

-(void)startInput
{

    [textField becomeFirstResponder];
}
@end
