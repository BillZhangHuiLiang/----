//
//  ViewController.m
//  Gomoku
//
//  Created by Bill on 14-1-23.
//  Copyright (c) 2014年 Bill. All rights reserved.
//

#import "ViewController.h"
#import "WithPlayerViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    WithPlayerViewController *withPlayerVC = [[WithPlayerViewController alloc] initWithNibName:@"WithPlayerViewController" bundle:Nil];
    [self.navigationController pushViewController:withPlayerVC animated:YES];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chosePlayType:(id)sender
{
    UIButton *choseButton = (UIButton *)sender;
    switch (choseButton.tag) {
        case 1:
            
            break;
        case 2:
        {
            WithPlayerViewController *withPlayerVC = [[WithPlayerViewController alloc] initWithNibName:@"WithPlayerViewController" bundle:Nil];
            [self.navigationController pushViewController:withPlayerVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}
@end
