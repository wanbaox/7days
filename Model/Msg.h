//
//  Msg.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-23.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Msg : NSManagedObject

@property (nonatomic, retain) NSString * fromid;
@property (nonatomic, retain) NSString * fromname;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * fromheadurl;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * isReaded;

@end
