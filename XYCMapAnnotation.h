//
//  MapAnnotation.h
//  VPPLibraries
//
//  自定义的annotation，在地图上显示的图钉
//
//  Created by Víctor on 20/10/11.
//  Copyright 2011 Víctor Pena Placer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "XYCMapCustomAnnotation.h"

@interface XYCMapAnnotation : NSObject <XYCMapCustomAnnotation> {

}

// if you implement XYCMapCustomAnnotation you can customize the annotation
// as much as you want.

// pin's coordinates (only required property)
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
// pin's title
@property (nonatomic, copy) NSString *title;
// pin's subtitle
@property (nonatomic, copy) NSString *subtitle;

/**用来标识是哪个post的annotation
 */
@property (nonatomic, copy) NSString *postID;


@end
