//
//  MsgRecent.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-23.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MsgRecent : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * newmsgcount;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * sort;
@property (nonatomic, retain) NSString * userid;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * userheadurl;

@end
