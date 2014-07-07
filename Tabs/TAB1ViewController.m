//
//  TAB1ViewController.m
//  HelloWorld
//
//  Created by 谢元潮 on 14-4-10.
//
//

#import "TAB1ViewController.h"
#import "VPPMapHelper.h"
#import "XYCMapAnnotation.h"
#import "HotViewController.h"
#import "PostDetailViewController.h"
#import "Post.h"
#import "PostListVC.h"
#import "Utils7Days.h"
#import "ImgData.h"

@interface TAB1ViewController ()
{

//    NSMutableArray * mPosts;
    NSMutableDictionary * mPostsDic;
    
}
@end

@implementation TAB1ViewController
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"7Days";
        
        
        self.tabBarItem = [[UITabBarItem alloc]initWithTitle:self.title image:[UIImage imageNamed:@"tab0.png"] selectedImage:[UIImage imageNamed:@"tab0_selected.png"]];
        
        
        //左边按钮，可以考虑放到地图上去
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"分享地址" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
        
        
        //右边按钮
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"动态" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
        
        //左右文字大小
//        [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:16],UITextAttributeFont, nil] forState:UIControlStateNormal];
        
        
        
        //tab item 文字的颜色
//        [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                [UIColor grayColor],
//                                                UITextAttributeTextColor,nil] forState:UIControlStateNormal];
//        
//        [self.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                 [UIColor blackColor],
//                                                 UITextAttributeTextColor,nil] forState:UIControlStateHighlighted];
        
        
//        [self.tabBarItem setImageInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
        
        
    }
    return self;
}

-(void)leftAction
{

    
}

-(void)rightAction:(id)sender
{

    
    //如果这个tab中有地图，采用下面点方式跳转，并且在新的页面hide bottombar，那当你返回的时候，就有一个问题，返回的时候bottombar会短了一截
//    [self.navigationController pushViewController:[[HotViewController alloc]initWithNibName:@"HotViewController" bundle:nil] animated:YES];

    
    [self.navigationController pushViewController:[[PostListVC alloc]initWithNibName:@"PostListVC" bundle:nil] animated:YES];
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    float eachWidth = self.tabBarController.tabBar.frame.size.width/4;
    
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tab_unread_bg.png"]];
    
    [img setFrame:CGRectMake(eachWidth*4-eachWidth/2+14, 4, 6, 6)];
    
    [self.tabBarController.tabBar addSubview:img];
    
    
    //baritem 背景
//    if (imgItemBg) {
//        
//        [imgItemBg setImage:[UIImage imageNamed:@"mymusicSelected.png"]];
//    }else{
//        
//        imgItemBg = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mymusicSelected.png"]];
//        [imgItemBg setFrame:CGRectMake(0, 0, eachWidth, self.tabBarController.tabBar.frame.size.height)];
//        
//        [self.tabBarController.tabBar addSubview:imgItemBg];
//    }
    
    
}

-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
//    [imgItemBg setImage:[UIImage imageNamed:@"mymusic.png"]];
    
}

-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	
    hasSettedUserCenter = NO;
    {
        mPostsDic = [[NSMutableDictionary alloc]init];
        
        Post * post = [[Post alloc]initWithPostID:@"7" sort:@"22" title:@"大家好" content:@"这里是post,无聊总" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]];
        post.latitude =30.212950;
        post.longitude =120.001930;
        NSArray * imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.8 url:@"" id:2], nil];
        post.imgs = imgs;
        [mPostsDic setObject:post forKey:post.postID];
        
        
        
//        post = [[Post alloc]initWithPostID:@"4" sort:@"22" title:@"22" content:@"我是吐槽" replyNumb:0 postType:PostType_tucao writerName:@"22" writerID:@"22" date:[NSDate date]];
//        post.latitude =30.212950;
//        post.longitude =120.041930;
//        imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.3 url:@"" id:2], nil];
//        post.imgs = imgs;
//        [mPostsDic setObject:post forKey:post.postID];
//        
//        
//        
//        post = [[Post alloc]initWithPostID:@"5" sort:@"22" title:@"22" content:@"我是吐槽1" replyNumb:0 postType:PostType_tucao writerName:@"22" writerID:@"22" date:[NSDate date]];
//        post.latitude =30.212950;
//        post.longitude =120.091930;
//        imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.3 url:@"" id:2], nil];
//        post.imgs = imgs;
//        [mPostsDic setObject:post forKey:post.postID];
//        
//        
//        
//        post = [[Post alloc]initWithPostID:@"3" sort:@"22" title:@"22" content:@"我是吐槽2" replyNumb:0 postType:PostType_tucao writerName:@"22" writerID:@"22" date:[NSDate date]];
//        post.latitude =30.232950;
//        post.longitude =120.041930;
//        imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.3 url:@"" id:2], nil];
//        post.imgs = imgs;
//        [mPostsDic setObject:post forKey:post.postID];
//        
//        
//        
//        post = [[Post alloc]initWithPostID:@"2" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]];
//        post.latitude =30.242950;
//        post.longitude =120.041930;
//        imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.3 url:@"" id:2], nil];
//        post.imgs = imgs;
//        [mPostsDic setObject:post forKey:post.postID];
//        
//        
//        
//        post = [[Post alloc]initWithPostID:@"1" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]];
//        post.latitude =30.232950;
//        post.longitude =120.041930;
//        imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.3 url:@"" id:2], nil];
//        post.imgs = imgs;
//        [mPostsDic setObject:post forKey:post.postID];
//        
//        
//        
//        post = [[Post alloc]initWithPostID:@"6" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]];
//        post.latitude =30.222950;
//        post.longitude =120.141930;
//        imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.3 url:@"" id:2], nil];
//        post.imgs = imgs;
//        [mPostsDic setObject:post forKey:post.postID];
//        
//        
//        
//        post = [[Post alloc]initWithPostID:@"9" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]];
//        post.latitude =30.212950;
//        post.longitude =120.141930;
//        imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.3 url:@"" id:2], nil];
//        post.imgs = imgs;
//        [mPostsDic setObject:post forKey:post.postID];
//        
//        
//        
//        post = [[Post alloc]initWithPostID:@"8" sort:@"22" title:@"22" content:@"bucuoma" replyNumb:0 postType:PostType_post writerName:@"22" writerID:@"22" date:[NSDate date]];
//        post.latitude =30.192950;
//        post.longitude =120.141930;
//        imgs = [NSArray arrayWithObjects:[[ImgData alloc]initWithRatio:0.3 url:@"" id:1], [[ImgData alloc]initWithRatio:0.3 url:@"" id:2], nil];
//        post.imgs = imgs;
//        [mPostsDic setObject:post forKey:post.postID];

    }
    
    [self addPostsIntoMap];
    
    
    
    //mapview的一些参数
//    MKCoordinateSpan theSpan;
//    //设置地图的范围，越小越精确
//    theSpan.latitudeDelta = 0.02;
//    theSpan.longitudeDelta = 0.02;
//    MKCoordinateRegion theRegion;
//    theRegion.center = [checkinLocation coordinate]; //让地图跳到之前获取到的当前位置checkinLocation
//    theRegion.span = theSpan;
//    [mapView setRegion:theRegion];
    
    
    
    
    //location
    if (!CLLocationManager.locationServicesEnabled)
	{
		NSLog(@"User has opted out of location services");
		return;
	}
	else
	{
		// User generally allows location calls
        locManager = [[CLLocationManager alloc] init];
        locManager.delegate = self;
		locManager.desiredAccuracy = kCLLocationAccuracyBest;
        [locManager startUpdatingLocation];//获取用户的GPS坐标
	}
    
}

//post转换成map上的annotation
-(void)addPostsIntoMap
{
    
    NSMutableArray * arr = [NSMutableArray array];
	XYCMapAnnotation *ann;
    
    NSEnumerator * enumerator = [mPostsDic keyEnumerator];
    
    id object;
    //遍历输出
    while(object = [enumerator nextObject])
    {
        
        //在这里我们得到的是键值，可以通过（1）得到，也可以通过这里得到的键值来得到它对应的value值
        //通过NSDictionary对象的objectForKey方法来得到
        //其实这里定义objectValue这个对象可以直接用NSObject，因为我们已经知道它的类型了，id在不知道类型的情况下使用
        Post * post = [mPostsDic objectForKey:object];
        if(post != nil)
        {
            ann = [[XYCMapAnnotation alloc] init];
            ann.postID = post.postID;
            ann.coordinate = CLLocationCoordinate2DMake(post.latitude,post.longitude);
            switch (post.postType) {
                case PostType_tucao:
                    
                    ann.title = post.content;
                    break;
                case PostType_post:
                    
                    ann.title = post.title;
                    ann.subtitle = post.content;
                    break;
                    
                default:
                    break;
            }
            ann.image = [UIImage imageNamed:@"pin_male"];
            [arr addObject:ann];

        }  
        
    }
    
    
//    for (Post * post in mPosts) {
//        
//        ann = [[XYCMapAnnotation alloc] init];
//        ann.postID = post.postID;
//        ann.coordinate = CLLocationCoordinate2DMake(post.latitude,post.longitude);
//        switch (post.postType) {
//            case PostType_tucao:
//                
//                ann.title = post.content;
//                break;
//            case PostType_post:
//                
//                ann.title = post.title;
//                ann.subtitle = post.content;
//                break;
//                
//            default:
//                break;
//        }
//        ann.image = [UIImage imageNamed:@"pin_male"];
//        [arr addObject:ann];
//    }
    
    
    
    
    if (_mh==nil) {
        
        // sets up the map
        _mh = [VPPMapHelper VPPMapHelperForMapView:self.mapView
                                pinAnnotationColor:MKPinAnnotationColorPurple
                             centersOnUserLocation:NO
                             showsDisclosureButton:YES
                                          delegate:self];
        
    }
    
    self.mapView.showsUserLocation = YES;
//    self.mapView.mapType = MKMapTypeStandard;
    _mh.userCanDropPin = YES;
//    _mh.centersOnUserLocation = YES;//已user坐标为mapview中心点，不能缩放，不能移动，都会回到原先的位置
    _mh.allowMultipleUserPins = YES;
    _mh.pinDroppedByUserClass = [XYCMapAnnotation class];
    _mh.shouldClusterPins = YES;//是否开启聚集功能
    [_mh setMapAnnotations:arr];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(float)RandomFloatStart:(float)a end:(float)b {
    float random = ((float) rand()) / (float) RAND_MAX;
    float diff = b - a;
    float r = random * diff;
    return a + r;
}

- (void) tonsOfPins {
    srand((unsigned)time(0));
    
    NSMutableArray *tempPlaces=[[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 100; i++) {
        
        XYCMapAnnotation *place= [[XYCMapAnnotation alloc] init];
        place.coordinate = CLLocationCoordinate2DMake([self RandomFloatStart:30.0 end:31.0],[self RandomFloatStart:120.0 end:123.0]);
        [place setTitle:[NSString stringWithFormat:@"Place %d title",i]];
        [place setSubtitle:[NSString stringWithFormat:@"subtitle %d title",i]];
        place.image = [UIImage imageNamed:@"pin_male"];
        [tempPlaces addObject:place];
        
    }
    
    _mh.shouldClusterPins = YES;
    [_mh setMapAnnotations:tempPlaces];
    
}


//- (void) toggleCenterOnMe {
//    _mh.centersOnUserLocation = !_mh.centersOnUserLocation;
//}



/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

#pragma mark -
#pragma mark XYCMapHelperDelegate

- (void) open:(id<MKAnnotation>)annotation {
    
    
    PostDetailViewController * postDetail = [[PostDetailViewController alloc]initWithNibName:@"PostDetailViewController" bundle:nil];
    
    postDetail.m_post = [mPostsDic valueForKey:((XYCMapAnnotation*)annotation).postID];
    
    [self.navigationController pushViewController:postDetail animated:YES];
    
}

- (BOOL) annotationDroppedByUserShouldOpen:(id<MKAnnotation>)annotation {
    
    //长按
    NSLog(@"地图上长按下了...");
    
//	MapAnnotationExample *ann = (MapAnnotationExample*)annotation;
//	
//	ann.title = @"Hi there!";
//	ann.pinAnnotationColor = MKPinAnnotationColorGreen;
	
	return YES;
}


-(IBAction)gotoUserLocation:(id)sender
{
    
    [_mh centerOnCoordinate:userLocation];
}

#pragma mark CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
	NSLog(@"Location manager error: %@", error.localizedFailureReason);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    
    if (!hasSettedUserCenter) {
        
        userLocation = newLocation.coordinate;
        [_mh centerOnCoordinate:userLocation];
        
        hasSettedUserCenter = YES;
    }
}


@end

