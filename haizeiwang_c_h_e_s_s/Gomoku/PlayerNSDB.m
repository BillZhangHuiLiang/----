//
//  PlayerNSDB.m
//  Gomoku
//
//  Created by 张会亮 on 14-3-5.
//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import "PlayerNSDB.h"
#import "PlayerNSList.h"
@implementation PlayerNSDB

-(id)init
{
    self = [super init];
    if (self) {
        playerNSList = [[PlayerNSList alloc] init];
    }
    return self;
}

-(void)addPlayer:(PlayerNS *)player
{
    [playerNSList addPlayer:player];
}

-(void)removePlayerAtIndex:(int)index;
{
    [playerNSList removePlayerAtIndex:index];
}

-(void)removePlayer:(PlayerNS *)player
{
    [playerNSList removePlayer:player];
}
-(void)removeAll
{
    [playerNSList removeAll];
}

-(void)replacePlayerAtIndex:(int)index withPlayer:(PlayerNS *)player
{
    [playerNSList replacePlayerAtIndex:index withPlayer:player];
}

-(int)count
{
    return playerNSList.count;
}
-(PlayerNS *)playerAtIndex:(int)index
{
    return [playerNSList playerAtIndex:index];
}
-(PlayerNS *)lastPlayer
{
    return [playerNSList lastPlayer];
}

-(BOOL)hasPlayerAtPlace:(CGPoint)place
{
    return [playerNSList hasPlayerAtPlace:place];
}


@end
