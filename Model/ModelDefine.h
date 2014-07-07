//
//  ModelDefine.h
//  SevenDays
//
//  Created by 谢元潮 on 14-6-22.
//
//

#ifndef SevenDays_ModelDefine_h
#define SevenDays_ModelDefine_h

typedef enum {

//    MsgTypeHideLetterReply,     //
//    MsgTypeAt,                  //@消息
    
    MsgTypePairedUser = 1,      //配对人发送过来的消息(直接在tab2界面的右上角显示)
    MsgTypePairRequire,         //配对请求
    MsgTypeReply,               //回复帖子 (将“隐藏信件的回复消息”放在一起)
    MsgTypeSupport,             //赞我
    MsgTypeLike,                //喜欢我
    MsgTypeVisit,               //访问我
    MsgTypeSystem,              //系统
    MsgTypeOther,               //其他 ("配对人发送过来的消息"放在这里)
    
}MsgType;

typedef enum {
    
    MsgSort_System = 1,             //系统的一些消息
    MsgSort_Other,              //其他的一些消息
    
}MsgSort;

#endif
