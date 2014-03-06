//
//  Functions.m
//  Gomoku
//
//  Created by Bill on 14-1-30.
//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import "Functions.h"
#import "PlayerNS.h"
static Functions *shareFunction;

@implementation Functions


+(Functions *)shareFunction
{
    if (!shareFunction) {
        shareFunction = [[Functions alloc] init];
    }
    return shareFunction;
}
+(CGPoint)calculateChessmanPointByTouch:(CGPoint)point
{
    return CGPointMake(point.x, point.y-50);
}
+(void)calculateDistancebetween
{
    
}

+(BOOL)calculateResultWithArr:(NSMutableArray *)arr
{
    
    
    
    
    return YES;
}


@end
