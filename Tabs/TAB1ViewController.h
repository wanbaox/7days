//
//  TAB1ViewController.h
//  HelloWorld
//
//  Created by 谢元潮 on 14-4-10.
//
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "XYCMapHelperDelegate.h"
#import "VPPMapHelper.h"

@interface TAB1ViewController : UIViewController <XYCMapHelperDelegate, CLLocationManagerDelegate>
{
    
    VPPMapHelper *_mh;
    
    CLLocationManager *locManager;
    CLLocationCoordinate2D userLocation;
    
    /**已经将用户的位置设置为mapview的中心一次。
     */
    BOOL hasSettedUserCenter;
    
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(IBAction)gotoUserLocation:(id)sender;

@end
