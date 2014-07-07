//
//  WritePostViewController.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-16.
//
//

#import "WritePostViewController.h"

@interface WritePostViewController ()
{

    IBOutlet UITextView * textView;
    
    IBOutlet UIButton * btn_smile;
    
}

@end

@implementation WritePostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initKeyboardEvent];
    
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
//    [textView becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(IBAction)goBack:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}

-(IBAction)rightAction:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^(void){
        
    }];
}


#pragma mark 键盘事件

- (void)initKeyboardEvent {
    
    //通过tap来隐藏键盘，然后通过获取键盘隐藏事件，来设置坐标
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    UITapGestureRecognizer *singleTapGR =
    [[UITapGestureRecognizer alloc] initWithTarget:self
                                            action:@selector(tapAnywhereToDismissKeyboard:)];
    NSOperationQueue *mainQuene =[NSOperationQueue mainQueue];
    
    //监听键盘show的事件
    [nc addObserverForName:UIKeyboardWillShowNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
                    [self.view addGestureRecognizer:singleTapGR];
                }];
    
    //监听键盘hide的事件
    [nc addObserverForName:UIKeyboardWillHideNotification
                    object:nil
                     queue:mainQuene
                usingBlock:^(NSNotification *note){
//                    [self.view removeGestureRecognizer:singleTapGR];
                }];

    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputKeyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputKeyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    
}

- (void)tapAnywhereToDismissKeyboard:(UIGestureRecognizer *)gestureRecognizer {
    //此method会将self.view里所有的subview的first responder都resign掉
    [self.view endEditing:YES];
    
}



#pragma mark 监听键盘的显示与隐藏
-(void)inputKeyboardWillShow:(NSNotification *)notification{
    
    NSLog(@"显示键盘");
    
    //键盘显示，设置toolbar的frame跟随键盘的frame
    CGFloat animationTime = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:animationTime animations:^{
        CGRect keyBoardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        NSLog(@"键盘即将出现：%@", NSStringFromCGRect(keyBoardFrame));
        
        btn_smile.frame = CGRectMake(0, keyBoardFrame.origin.y-btn_smile.frame.size.height, btn_smile.bounds.size.width,btn_smile.frame.size.height);
        
        textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, textView.frame.size.width, btn_smile.frame.origin.y);

    }];
    
}

-(void)inputKeyboardWillHide:(NSNotification *)notification{
//    [faceButton setBackgroundImage:[UIImage imageNamed:@"Text"] forState:UIControlStateNormal];
//    keyboardIsShow=NO;
    
   
    NSLog(@"hide keyboard");
    //键盘显示，设置toolbar的frame跟随键盘的frame
    CGFloat animationTime = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    [UIView animateWithDuration:animationTime animations:^{
        CGRect keyBoardFrame = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
        NSLog(@"键盘即将出现：%@", NSStringFromCGRect(keyBoardFrame));
        
        btn_smile.frame = CGRectMake(0, keyBoardFrame.origin.y-btn_smile.frame.size.height, btn_smile.bounds.size.width,btn_smile.frame.size.height);
        
        textView.frame = CGRectMake(textView.frame.origin.x, textView.frame.origin.y, textView.frame.size.width, btn_smile.frame.origin.y);
        
    }];
    
}

@end
