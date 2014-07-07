//
//  PostListVC.h
//  SevenDays
//
//  帖子列表，根据不同类型，这里请求服务器获取帖子，展现帖子
//
//  Created by 谢元潮 on 14-6-19.
//
//

#import <UIKit/UIKit.h>
#import "XYCTalkInputBar.h"

//这里需要展现的内容列别（赞我的，喜欢我的，访问我的...）
typedef enum {

    PostListType_like = 1,
    PostListType_reply,
    PostListType_pair_request,
    PostListType_support,
    PostListType_visit,
    PostListType_system,
    
}PostListType;

@interface PostListVC : UIViewController<UIGestureRecognizerDelegate,XYCTalkInputBarDelegate>

@property(nonatomic) PostListType postlistType;

@end
