//
//  PlayerNSList.m
//  Gomoku
//
//  Created by 张会亮 on 14-3-5.
//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import "PlayerNSList.h"
#import "PlayerNS.h"
@implementation PlayerNSList

-(id)init
{
    self = [super init];
    if (self) {
        playerNSList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addPlayer:(PlayerNS *)player
{
    [playerNSList addObject:player];
}

-(void)removePlayerAtIndex:(int)index;
{
    [playerNSList removeObjectAtIndex:index];
}

-(void)removePlayer:(PlayerNS *)player
{
    [playerNSList removeObject:player];
}
-(void)removeAll
{
    [playerNSList removeAllObjects];
}

-(void)replacePlayerAtIndex:(int)index withPlayer:(PlayerNS *)player
{
    [playerNSList replaceObjectAtIndex:index withObject:player];
}

-(int)count
{
    return playerNSList.count;
}
-(PlayerNS *)playerAtIndex:(int)index
{
    return [playerNSList objectAtIndex:index];
}
-(PlayerNS *)lastPlayer
{
    return [playerNSList lastObject];
}

-(BOOL)hasPlayerAtPlace:(CGPoint)place
{
    BOOL ifHas = NO;
    for (PlayerNS *player in playerNSList) {
        if (player.chessmansPlace.x == place.x && player.chessmansPlace.y == place.y ) {
            ifHas = YES;
        }
    }
    return ifHas;
}

@end
