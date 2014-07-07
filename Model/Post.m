//
//  Post.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-11.
//
//

#import "Post.h"

@implementation Post

@synthesize postID,content,date,writerID,writerName,sort,title,replyNumb,longitude,latitude,postType,imgs;


-(id)initWithPostID:(NSString *)postIDTmp
               sort:(NSString *)sortTmp
              title:(NSString *)titleTmp
            content:(NSString *)contentTmp
          replyNumb:(NSInteger)replyNumbTmp
           postType:(PostType)postTypeTmp
         writerName:(NSString *)writerNameTmp
           writerID:(NSString *)writerIDTmp
               date:(NSDate *)dateTmp
{
    
    self = [super init];
    
    if (self) {
        
        self.postID = postIDTmp;
        self.sort = sortTmp;
        self.title = titleTmp;
        self.content = contentTmp;
        self.writerName = writerNameTmp;
        self.writerID = writerIDTmp;
        self.date = dateTmp;
        self.replyNumb = replyNumbTmp;
        self.postType = postTypeTmp;
        
    }
    
    return self;
    
}

-(NSString *)toString
{

    return [NSString stringWithFormat:@"[postID:%@],[sort:%@],[title:%@],[content:%@],[writerID:%@],[writerName:%@],[date:%@],[replyNumb:%i],[replyNumb:%f],[replyNumb:%f],[postType:%i]",postID,sort,title,content,writerID,writerName,date,replyNumb,longitude,latitude,postType];
    
}

@end
