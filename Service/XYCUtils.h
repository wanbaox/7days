//
//  XYCUtils.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-13.
//
//

#import <Foundation/Foundation.h>

@interface XYCUtils : NSObject

//----------------label string
/**计算文字的高度
 */
+ (CGFloat)labelHeigtFromStringContent:(NSString *)text fontSizeandLabelWidth:(CGFloat)width andFontSize:(CGFloat)fontSize;

/**计算文字的高度和宽度
 */
+ (CGSize)labelSizeFromStringContent:(NSString *)text fontSizeandLabelWidth:(CGFloat)width andFontSize:(CGFloat)fontSize;


//----------------tableview
/**隐藏多余cell的横线
 */
+ (void)tableViewsetExtraCellLineHidden: (UITableView *)tableView;


//----------------date
/**手机qq上的时间显示风格
 */
+(NSString*)dateFormate4TalkListQQ:(NSDate*)date;
+(NSInteger)dateGetMintureFromDate:(NSDate *)date;
+(int)dateGetHourFromDate:(NSDate *)date;
+(NSInteger)dateGetDayFromDate:(NSDate *)date;
+(NSInteger)dateGetMonthFromDate:(NSDate *)date;
+(NSInteger)dateGetYearFromDate:(NSDate *)date;


//----------------screen
/**
 *获取屏幕尺寸
 */
+(CGRect)screenFrame;
/**
 *如果没有隐藏状态栏，返回的状态栏以下部分的坐标，如果隐藏了状态栏，那就和screenframe一样了
 */
+(CGRect)applicationFrame;
+(CGRect)statusBarFrame;

@end
