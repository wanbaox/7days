//
//  DBHelper.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-22.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Msg.h"
#import "MsgRecent.h"
#import "ModelDefine.h"




@interface DBHelper : NSObject<NSFetchedResultsControllerDelegate>
{
    
    NSFetchedResultsController *fetcher;
}
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

+(DBHelper *) sharedInstance;

-(void)update;
-(void)deleteObject:(id)object;


//msg
-(NSMutableArray*)fetchMsgs;
-(NSMutableArray*)fetchMsgsWithType:(MsgType)type readed:(BOOL)readed;
-(NSMutableArray*)fetchMsgsWithUserID:(NSString*)userid readed:(BOOL)readed;
-(void)saveMsgFromID:(NSString*)fromid fromname:(NSString*)fromname fromheadurl:(NSString*)fromheadurl msgtype:(MsgType)msgtype content:(NSString*)content date:(NSDate *)date isreaded:(BOOL)isreaded;
-(void)clearMsgs;


//msg recent
-(NSMutableArray*)fetchMsgRecents;
-(MsgRecent*)fetchMsgRecentWithType:(MsgType)type;
-(MsgRecent*)fetchMsgRecentWithUserID:(NSString*)userid;
-(void)saveMsgRecentSort:(MsgSort)sort type:(MsgType)type content:(NSString*)conetent date:(NSDate*)date newmsgcount:(NSInteger)newmsgcount userid:(NSString*)userid username:(NSString*)username userheadurl:(NSString*)userheadurl;
-(void)clearMsgRecents;

-(void)setMsgRecentReaded:(MsgRecent*)msgRecent;

- (int) getUnreadMsgNumber;



@end
