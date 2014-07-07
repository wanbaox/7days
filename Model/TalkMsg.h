//
//  TalkMsg.h
//  SevenDays
//
//  聊天消息
//
//  Created by 谢元潮 on 14-6-16.
//
//

#import <Foundation/Foundation.h>

typedef enum {

    TalkMsgType_WORDS = 1,
    TalkMsgType_PIC,
    TalkMsgType_AUDIO,
    
} TalkMsgType;

@interface TalkMsg : NSObject

@property (nonatomic, retain) NSString * fromid;
@property (nonatomic, retain) NSString * toid;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * date;


@end
