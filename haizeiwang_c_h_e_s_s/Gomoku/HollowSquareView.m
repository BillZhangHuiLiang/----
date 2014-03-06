//
//  HollowSquareView.m
//  Gomoku
//
//  Created by 张会亮 on 14-2-28.
//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import "HollowSquareView.h"
#import "Constant.h"
static HollowSquareView *hollowSquareV;

@implementation HollowSquareView



+(HollowSquareView *)shareHollowSquareView
{
    if (!hollowSquareV) {
        hollowSquareV = [[HollowSquareView alloc] initWithFrame:CGRectMake(50, 50, Size_HollowSquareWidth, Size_HollowSquareheight)];
        hollowSquareV.backgroundColor = [UIColor clearColor];
        
        for (int i = 0; i<4; i++) {
            UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(i%2*(Size_HollowSquareWidth/4.0*3), i/2*(Size_HollowSquareheight-1), Size_HollowSquareWidth/4.0, 1)];
            lineView.backgroundColor = [UIColor redColor];
            [hollowSquareV addSubview:lineView];
            
            UIView *rowView = [[UIView alloc] initWithFrame:CGRectMake(i%2*(Size_HollowSquareWidth-1), i/2*(Size_HollowSquareheight/4.0*3), 1, Size_HollowSquareheight/4.0)];
            rowView.backgroundColor = [UIColor redColor];
            [hollowSquareV addSubview:rowView];
        }
        
        
    }
    return hollowSquareV;
}


/*
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
*/
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
