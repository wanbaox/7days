//
//  XYCUtils.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-13.
//
//

#import "XYCUtils.h"

@implementation XYCUtils

//label     string
+ (CGFloat)labelHeigtFromStringContent:(NSString *)text fontSizeandLabelWidth:(CGFloat)width andFontSize:(CGFloat)fontSize
{
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, 20000)];
    
    return size.height;
    
}

+ (CGSize)labelSizeFromStringContent:(NSString *)text fontSizeandLabelWidth:(CGFloat)width andFontSize:(CGFloat)fontSize
{
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, 20000)];
    
    return size;
    
}



//tableview
+ (void)tableViewsetExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}



//date
+(NSString*)dateFormate4TalkListQQ:(NSDate*)date {
    
    
    NSDate * currentDate = [NSDate date];
    
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    [comps setMonth:[self dateGetMonthFromDate:currentDate]];
    [comps setDay:[self dateGetDayFromDate:currentDate]];
    [comps setYear:[self dateGetYearFromDate:currentDate]];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *todayDate = [calendar dateFromComponents:comps];
    
    
    
    NSTimeInterval a_day = 24*60*60;
    
    
    NSTimeInterval during = todayDate.timeIntervalSince1970-date.timeIntervalSince1970;
    if (during>a_day) {
        
        //05-06
        
        return [NSString stringWithFormat:@"%i-%i",[self dateGetMonthFromDate:date],[self dateGetDayFromDate:date]];
    }else if(during>0){
        
        //昨天
        return NSLocalizedString(@"words_yesterday", nil);
        
    }else if(abs(during)>(a_day/2)){
        
        //下午
        return [NSString stringWithFormat:@"%@ %i:%i",NSLocalizedString(@"words_pm", nil),[self dateGetHourFromDate:date],[self dateGetMintureFromDate:date]];
    }else{
        
        //上午
        return [NSString stringWithFormat:@"%@ %i:%i",NSLocalizedString(@"words_am", nil),[self dateGetHourFromDate:date],[self dateGetMintureFromDate:date]];
    }
    
}

+(NSInteger)dateGetYearFromDate:(NSDate *)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    //当前的时分秒获得
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit) fromDate:date];
    NSInteger ret = [comps year];
    
    return ret;
    
}

+(NSInteger)dateGetMonthFromDate:(NSDate *)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    //当前的时分秒获得
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit) fromDate:date];
    NSInteger ret = [comps month];
    
    return ret;
    
}

+(NSInteger)dateGetDayFromDate:(NSDate *)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    //当前的时分秒获得
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit) fromDate:date];
    NSInteger ret = [comps day];
    
    return ret;
    
}

+(NSInteger)dateGetHourFromDate:(NSDate *)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    //当前的时分秒获得
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit) fromDate:date];
    NSInteger ret = [comps hour];
    
    return ret;
    
}

+(NSInteger)dateGetMintureFromDate:(NSDate *)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    
    //当前的时分秒获得
    comps = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit|NSMinuteCalendarUnit) fromDate:date];
    NSInteger ret = [comps minute];
    
    return ret;
    
}


+(CGRect)screenFrame
{

    return [ UIScreen mainScreen ].bounds;
}

+(CGRect)applicationFrame
{
    
    return [ UIScreen mainScreen ].applicationFrame;
}

+(CGRect)statusBarFrame
{

    return [[UIApplication sharedApplication] statusBarFrame];
}

@end
