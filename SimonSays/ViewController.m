//
//  ViewController.m
//  SimonSays
//
//  Created by Samia Al Rahmani on 3/17/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UIButton *blueSquare;
@property (weak, nonatomic) IBOutlet UIButton *redSquare;
@property (weak, nonatomic) IBOutlet UIButton *orangeSquare;
@property (weak, nonatomic) IBOutlet UIButton *greenSquare;

- (IBAction)startRound:(id)sender;

- (IBAction)redButtonPressed:(id)sender;
- (IBAction)blueButtonPressed:(id)sender;
- (IBAction)orangeButtonPressed:(id)sender;
- (IBAction)greenButtonPressed:(id)sender;


@end

@implementation ViewController<SimonDelegate>


- (void)viewDidLoad {
    [super viewDidLoad];

    self.simon = [[SimonSays alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)startRound:(id)sender {
    [self.simon addToPattern];
}


- (IBAction)redButtonPressed:(id)sender {
    [self.simon inputColor:@"red"];
}

- (IBAction)blueButtonPressed:(id)sender {
    [self.simon inputColor:@"blue"];
}

- (IBAction)orangeButtonPressed:(id)sender {
    [self.simon inputColor:@"orange"];
}

- (IBAction)greenButtonPressed:(id)sender {
    [self.simon inputColor:@"green"];
}


- (void)animateLose{
    
}

-(void)animateWin{
    [UIView animateWithDuration:0.5 animations:^{
        self.greenSquare.alpha = 1.0;
        self.blueSquare.alpha = 1.0;
        self.redSquare.alpha = 1.0;
        self.orangeSquare.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.greenSquare.alpha = 0.5;
            self.blueSquare.alpha = 0.5;
            self.redSquare.alpha = 0.5;
            self.orangeSquare.alpha = 0.5;
        }];
    }];
}


//-(void)animateSequence:(NSMutableArray *)colorsArray{
//    [

    


@end
