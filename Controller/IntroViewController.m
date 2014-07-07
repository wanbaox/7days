#import "IntroViewController.h"
#import "IntroControll.h"
#import "TAB1ViewController.h"
#import "TAB2ViewController.h"
#import "TAB3ViewController.h"
#import "TAB4ViewController.h"
#import "XYCTabController.h"

@implementation IntroViewController

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    self.wantsFullScreenLayout = YES;
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    return self;
}

- (void) loadView {
    [super loadView];
    
    
    IntroModel *model1 = [[IntroModel alloc] initWithTitle:@"Example 1" description:@"Hi, my name is Dmitry" image:@"intro1.png"];
    
    IntroModel *model2 = [[IntroModel alloc] initWithTitle:@"Example 2" description:@"Several sample texts in Old, Middle, Early Modern, and Modern English are provided here for practice, reference, and reading." image:@"intro2.png"];
    
    IntroModel *model3 = [[IntroModel alloc] initWithTitle:@"Example 3" description:@"The Tempest is the first play in the First Folio edition (see the signature) even though it is a later play (namely 1610) than Hamlet (1600), for example. The first page is reproduced here" image:@"intro3.png"];
    
    self.view = [[IntroControll alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) pages:@[model1, model2, model3]];
    
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    
    UIButton * btn_enterapp = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-70, self.view.frame.size.height-60, 140, 43)];
    [btn_enterapp setBackgroundImage:[UIImage imageNamed:@"btn_enter_app.png"] forState:UIControlStateNormal];
//    btn_enterapp.backgroundColor = [UIColor blueColor];
//    [btn_enterapp setTitle:@"开始约会" forState:UIControlStateNormal];
//    [btn_enterapp setTitle:@"开始约会" forState:UIControlStateHighlighted];
//    btn_enterapp.titleLabel.textColor = [UIColor whiteColor];
    [btn_enterapp addTarget:self action:@selector(enter:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn_enterapp];
    
}

-(void)enter:(id)sender
{

    
    // Globally use a black tint for nav bars
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];//导航栏左右两边文字的颜色
    
    // Build an array of controllers
    NSMutableArray *controllers = [NSMutableArray array];
    
    //tab1
    TAB1ViewController *controller = [[TAB1ViewController alloc]initWithNibName:@"TAB1ViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    //    nav.navigationBar.barTintColor = [UIColor blackColor];//上面整个颜色
    [controllers addObject:nav];
    
    
    //tab2
    TAB2ViewController *controller2 = [[TAB2ViewController alloc]initWithNibName:@"TAB2ViewController" bundle:nil];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:controller2];
    nav2.navigationBar.barStyle = UIBarStyleDefault;
    [controllers addObject:nav2];
    
    
    //tab3
    TAB3ViewController *controller3 = [[TAB3ViewController alloc]initWithNibName:@"TAB2ViewController" bundle:nil];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:controller3];
    nav3.navigationBar.barStyle = UIBarStyleDefault;
    [controllers addObject:nav3];
    
    
    //tab4
    TAB4ViewController *controller4 = [[TAB4ViewController alloc]initWithNibName:@"TAB2ViewController" bundle:nil];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:controller4];
    nav4.navigationBar.barStyle = UIBarStyleDefault;
    [controllers addObject:nav4];
    
    
    XYCTabController * tabBarController = [[XYCTabController alloc] init];
    tabBarController.viewControllers = controllers;
    tabBarController.customizableViewControllers = controllers;
    tabBarController.delegate = self;
    //    tabBarController.tabBar.barTintColor = [UIColor blackColor];//下面整条tab的颜色
    //    tabBarController.tabBar.backgroundImage=[UIImage imageNamed:@"tab_unread_bg.png"];//下面整条tab的背景图片
    
    [self.navigationController pushViewController:tabBarController animated:NO];
}


-(void)viewWillDisappear:(BOOL)animated
{

    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
