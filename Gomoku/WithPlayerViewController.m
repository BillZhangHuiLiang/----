//
//  WithPlayerViewController.m
//  Gomoku
//
//  Created by Bill on 14-1-30.
//  Copyright (c) 2014年 Bill. All rights reserved.
//
#define ChessboardWidth (chessBoard.frame.size.width)
#define ChessboardHight (chessBoard.frame.size.height)
#define ChessboardMargin (10)
#define ChessboardInterval ((chessBoard.frame.size.width-2*ChessboardMargin)/14.0)
#define ChessboardOrigin (chessBoard.frame.origin)

#import "WithPlayerViewController.h"
#import "ChessBoard.h"
#import "Functions.h"
#import "Constant.h"
#import "HollowSquareView.h"
#import "PlayerNSDB.h"


@interface WithPlayerViewController ()
{
    PlayerNSDB *playerNSDB;
    //用于存储棋盘上的个个点的数组
    NSMutableArray *chessBoardAllSpotArr;
}
@end

@implementation WithPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor colorWithRed:242.0/255 green:205.0/255 blue:53.0/255 alpha:1];
    
    playerNSDB = [[PlayerNSDB alloc] init];
    
    //初始化单例方法
    [Functions shareFunction];
    //添加棋盘到本controller中
    ChessBoard *chessBoard = [[ChessBoard alloc] initWithFrame:CGRectMake(10, 200, 300, 300)];
    [self.view addSubview:chessBoard];
    
    //向棋盘中添加一个长按手势，用来放棋子
    UIPanGestureRecognizer *putChessman = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(putChessman:)];
    [self.view addGestureRecognizer:putChessman];
    
    //把棋盘上的所有的点的坐标都添加到一个数组中
    chessBoardAllSpotArr = [[NSMutableArray alloc] init];
    for (int i = 0 ; i<15; i++) {
        for (int j = 0; j<15; j++) {
            PlayerNS *chessboardSpot = [[PlayerNS alloc] init];
            chessboardSpot.chessmansPlace = CGPointMake(i*ChessboardInterval+ChessboardMargin+ChessboardOrigin.x, j*ChessboardInterval+ChessboardMargin+ChessboardOrigin.y);
            [chessBoardAllSpotArr addObject:chessboardSpot];
        }
    }
    
    
}


#pragma mark tap手势的方法
-(void)putChessman:(id)sender
{
    UIPanGestureRecognizer *putChessman = (UIPanGestureRecognizer *)sender;
    CGPoint touchPlace = [putChessman locationInView:self.view];
    CGPoint suitChessmanPlace = [Functions calculateChessmanPointByTouch:touchPlace];
    switch (putChessman.state) {
        case UIGestureRecognizerStateBegan:{
            [self.view addSubview:[HollowSquareView shareHollowSquareView]];
            for (PlayerNS *someSpot in chessBoardAllSpotArr)
            {
                if (CGRectContainsPoint(CGRectMake(someSpot.chessmansPlace.x-15, someSpot.chessmansPlace.y-15, 30, 30), suitChessmanPlace))
                {
                    [HollowSquareView shareHollowSquareView].center  = someSpot.chessmansPlace;
                    break;
                }
            }
        }
            break;
        case UIGestureRecognizerStateChanged:{
            for (PlayerNS *someSpot in chessBoardAllSpotArr)
            {
                if (CGRectContainsPoint(CGRectMake(someSpot.chessmansPlace.x-15, someSpot.chessmansPlace.y-15, 30, 30), suitChessmanPlace))
                {
                    [HollowSquareView shareHollowSquareView].center  = someSpot.chessmansPlace;
                    break;
                }
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (![playerNSDB hasPlayerAtPlace:[HollowSquareView shareHollowSquareView].center]) {
                //用于当做棋子放在棋盘上的imageView
                UIImageView *chessman = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"black.png"]];
                if ([playerNSDB lastPlayer].isBlackPlayer) {
                    chessman.image = [UIImage imageNamed:@"white.png"];
                }
                chessman.frame = CGRectMake([HollowSquareView shareHollowSquareView].center.x-Size_Chessmanwidth/2.0, [HollowSquareView shareHollowSquareView].center.y-Size_ChessmanHeight/2.0, Size_Chessmanwidth, Size_ChessmanHeight);
                [self.view addSubview:chessman];
                //把当前的棋子的信息添加到数组中
                PlayerNS *player = [[PlayerNS alloc] init];
                player.isBlackPlayer = ![playerNSDB lastPlayer].isBlackPlayer;
                player.chessmansPlace = chessman.center;
                [playerNSDB addPlayer:player];
            }
            
        }
            break;
            
        default:
            break;
    }
}

#pragma mark 页面上的四个button的方法
- (IBAction)foundationButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    switch (button.tag) {
        case 1:{
            UIAlertView *goBackAler = [[UIAlertView alloc] initWithTitle:@"返回首页" message:Function_GoBackStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [goBackAler show];
        }
            break;
        case 2:{
            UIAlertView *newAler = [[UIAlertView alloc] initWithTitle:@"新局" message:Function_NewStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [newAler show];
        }
            break;
        case 3:{
        }
            break;
        case 4:{
            UIAlertView *giveUpAler = [[UIAlertView alloc] initWithTitle:@"认输" message:Function_GiveUpStr delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [giveUpAler show];
        }
            break;
            
        default:
            break;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView.title isEqualToString:@"返回首页"] && buttonIndex == 1) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }else if([alertView.title isEqualToString:@"新局"] && buttonIndex == 1) {
        
    }else if([alertView.title isEqualToString:@"认输"] && buttonIndex == 1) {
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
@end
