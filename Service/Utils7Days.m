//
//  Utils7Days.m
//  SevenDays
//
//  Created by 谢元潮 on 14-6-21.
//
//

#import "Utils7Days.h"
#import "Post.h"

@implementation Utils7Days


+(NSArray *)ArraySort4Posts:(NSArray *)posts
{

    NSComparator cmptr = ^(id obj1, id obj2)
    {
        if (((Post*)obj1).postID.integerValue > ((Post*)obj2).postID.integerValue)
        {
        
            return (NSComparisonResult)NSOrderedDescending;
        }
        
        if (((Post*)obj1).postID.integerValue < ((Post*)obj2).postID.integerValue)
        {
        
            return (NSComparisonResult)NSOrderedAscending;
        }
        
        return (NSComparisonResult)NSOrderedSame;
    };

    NSArray *array = [posts sortedArrayUsingComparator:cmptr];
    
    return array;
    
}


//+(NSDictionary *)ArrayPost2Dictionary:(NSArray *)posts
//{
//
//    NSDictionary * postsDictionary;
//    for (Post * post in posts) {
//        
//        postsDictionary
//    }
//    
//}

@end
