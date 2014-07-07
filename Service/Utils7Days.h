//
//  Utils7Days.h
//  SevenDays
//
//  7days专属的工具类
//
//  Created by 谢元潮 on 14-6-21.
//
//

#import <Foundation/Foundation.h>

@interface Utils7Days : NSObject

/**
 * 帖子数组排序，按照post的postid排序
 */
+(NSArray *)ArraySort4Posts:(NSArray *)posts;


///**
// * 将post数组转换成dictionary,   key是 postid
// */
//+(NSDictionary *)ArrayPost2Dictionary:(NSArray *)posts;

@end
