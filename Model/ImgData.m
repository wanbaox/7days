//
//  ImgData.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-21.
//
//

#import "ImgData.h"

@implementation ImgData

@synthesize ratio,url;

-(id)initWithRatio:(CGFloat)ratioT url:(NSString*)urlT id:(NSInteger)idT
{

    self = [super init];
    
    if (self) {
        
        self.ratio = ratioT;
        self.url = urlT;
        self.imgID = idT;
    }
    return self;
}
@end
