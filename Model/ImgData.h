//
//  ImgData.h
//  SevenDays
//
//  为了显示让图片在tableviewcell 中固定显示，
//
//  Created by 谢元潮 on 14-6-21.
//
//

#import <Foundation/Foundation.h>

@interface ImgData : NSObject

@property (nonatomic, retain) NSString * url;

/**高宽比例
 */
@property (nonatomic) CGFloat ratio;
@property (nonatomic) NSInteger imgID;

-(id)initWithRatio:(CGFloat)ratioT url:(NSString*)urlT id:(NSInteger)idT;

@end
