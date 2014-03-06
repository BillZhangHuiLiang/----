//
//  ChessBoard.m
//  Gomoku
//
//  Created by Bill on 14-1-28.

//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import "ChessBoard.h"

#define ChessboardWidth (frame.size.width)
#define ChessboardHight (frame.size.height)

#define ChessboardMargin (10)
#define ChessboardInterval ((frame.size.width-2*ChessboardMargin)/14.0)



@implementation ChessBoard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //在棋盘中画出中心大点
        UIImageView *centerView = [[UIImageView alloc] initWithFrame:CGRectMake(ChessboardWidth/2.0-ChessboardInterval/8,
                                                                                ChessboardHight/2.0-ChessboardInterval/8,
                                                                                ChessboardInterval/4,
                                                                                ChessboardInterval/4)];
        centerView.image = [UIImage imageNamed:@"black.png"];
        [self addSubview:centerView];
        //在棋盘上画出四周边线和四个大点
        for (int i = 0; i<2; i++) {
            //四条边线
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, i*(ChessboardHight-5),ChessboardWidth,5)];
            lineView.backgroundColor = [UIColor blackColor];
            [self addSubview:lineView];
            UIView *rowView = [[UIView alloc] initWithFrame:CGRectMake(i*(ChessboardHight-5), 0, 5,ChessboardHight)];
            rowView.backgroundColor = [UIColor blackColor];
            [self addSubview:rowView];
            //四个大点
            UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ChessboardMargin+3*ChessboardInterval+i*8*ChessboardInterval-ChessboardInterval/8, ChessboardMargin+3*ChessboardInterval-ChessboardInterval/8,ChessboardInterval/4, ChessboardInterval/4)];
            lineImageView.image = [UIImage imageNamed:@"black.png"];
            [self addSubview:lineImageView];
            UIImageView *rowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(ChessboardMargin+3*ChessboardInterval+i*8*ChessboardInterval-ChessboardInterval/8, ChessboardMargin+11*ChessboardInterval-ChessboardInterval/8,ChessboardInterval/4, ChessboardInterval/4)];
            rowImageView.image = [UIImage imageNamed:@"black.png"];
            [self addSubview:rowImageView];
        }
        //画出棋盘的横竖线
        for (int i = 0; i<15; i++) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(ChessboardMargin,
                                                                        i*ChessboardInterval + ChessboardMargin,
                                                                        ChessboardWidth-2*ChessboardMargin,
                                                                        1)];
            lineView.backgroundColor = [UIColor blackColor];
            [self addSubview:lineView];
            UIView *rowView = [[UIView alloc] initWithFrame:CGRectMake(i*ChessboardInterval + ChessboardMargin,
                                                                       ChessboardMargin,
                                                                       1,
                                                                       ChessboardHight - 2*ChessboardMargin)];
            rowView.backgroundColor = [UIColor blackColor];
            [self addSubview:rowView];
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
