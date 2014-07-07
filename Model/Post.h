//
//  Post.h
//  SevenDays
//
//  帖子类
//
//  Created by 谢元潮 on 14-6-11.
//
//

#import <Foundation/Foundation.h>


typedef enum {

    PostType_tucao,     //吐槽，没有title，有content
    PostType_post,      //帖子，有title，有content(用户没有填写title的，必须默认时间为titile)
    PostType_reply,     //回复，没有title，有content
    
}PostType;

@interface Post : NSObject

@property (nonatomic, retain) NSString * postID;    //帖子的id，服务器上获取
@property (nonatomic, retain) NSString * sort;      //帖子的类别，用来区分论坛里面的位置
@property (nonatomic) PostType postType;            //吐槽，心情，帖子，还是回复
//@property (nonatomic, retain) NSString * replyedID;    //如果是回复消息，那被回复的id
//图片url，在显示之前可以先获取网络图片的尺寸，在app里面用一张默认图片加载

/**消息有可能没有titile，只包含content
 */
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSArray * imgs;
@property (nonatomic) NSInteger replyNumb;  //回复消息也有可能有人回复


@property (nonatomic, retain) NSString * writerName;
@property (nonatomic, retain) NSString * writerID;

/**纬度
 */
@property (nonatomic, assign) double latitude;

/**经度
 */
@property (nonatomic, assign) double longitude;

@property (nonatomic, retain) NSDate * date;

-(id)initWithPostID:(NSString *)postID
               sort:(NSString *)sort
              title:(NSString *)title
            content:(NSString *)content
          replyNumb:(NSInteger)replyNumb
           postType:(PostType)postType
         writerName:(NSString *)writerName
           writerID:(NSString *)writerID
               date:(NSDate *)date;

-(NSString *)toString;

@end
