//
//  PlayerNS.h
//  Gomoku
//
//  Created by Bill on 14-1-30.
//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerNS : NSObject

@property (nonatomic, assign) CGPoint chessmansPlace;
@property (nonatomic, assign) BOOL isBlackPlayer;

@property (nonatomic, strong) UIImageView *image;

@end
