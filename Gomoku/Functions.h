//
//  Functions.h
//  Gomoku
//
//  Created by Bill on 14-1-30.
//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Functions : NSObject
//单例方法
+(Functions *)shareFunction;

+(void)calculateDistancebetween;

//根据触摸屏幕的位置计算出棋子的位置
+(CGPoint)calculateChessmanPointByTouch:(CGPoint)point;


+(BOOL)calculateResultWithArr:(NSMutableArray *)arr;


@end
