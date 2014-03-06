//
//  PlayerNSList.h
//  Gomoku
//
//  Created by 张会亮 on 14-3-5.
//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PlayerNS;

@interface PlayerNSList : NSObject
{
    NSMutableArray *playerNSList;
}

-(id)init;

-(void)addPlayer:(PlayerNS *)player;

-(void)removePlayerAtIndex:(int)index;
-(void)removePlayer:(PlayerNS *)player;
-(void)removeAll;

-(void)replacePlayerAtIndex:(int)index withPlayer:(PlayerNS *)player;

-(int)count;
-(PlayerNS *)playerAtIndex:(int)index;
-(PlayerNS *)lastPlayer;
-(BOOL)hasPlayerAtPlace:(CGPoint)place;

@end
