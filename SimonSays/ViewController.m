
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

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    self.simon = [[SimonSays alloc] init];
    self.simon.delegate = self;
    
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
    [UIView animateWithDuration:0.2 animations:^{
        self.redSquare.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.redSquare.alpha = 0.5;
        }];
    }];
}

- (IBAction)blueButtonPressed:(id)sender {
    [self.simon inputColor:@"blue"];
    [UIView animateWithDuration:0.2 animations:^{
        self.blueSquare.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.blueSquare.alpha = 0.5;
        }];
    }];
 
}

- (IBAction)orangeButtonPressed:(id)sender {
    [self.simon inputColor:@"orange"];
    [UIView animateWithDuration:0.2 animations:^{
        self.orangeSquare.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.orangeSquare.alpha = 0.5;
        }];
    }];
}

- (IBAction)greenButtonPressed:(id)sender {
    [self.simon inputColor:@"green"];
    [UIView animateWithDuration:0.2 animations:^{
        self.greenSquare.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            self.greenSquare.alpha = 0.5;
        }];
    }];
}


- (void)animateLose{
    NSLog(@"Animate Lose!");
}

-(void)animateWin{
    
    NSLog(@"Animate Win!");
    [UIView animateWithDuration:0.5 animations:^{
        self.greenSquare.alpha = 1.0;
        self.blueSquare.alpha = 1.0;
        self.redSquare.alpha = 1.0;
        self.orangeSquare.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            self.greenSquare.alpha = 0.5;
            self.blueSquare.alpha = 0.5;
            self.redSquare.alpha = 0.5;
            self.orangeSquare.alpha = 0.5;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"finishedWinAnimation" object:nil];
        }];
    }];
//                [[NSNotificationCenter defaultCenter] postNotificationName:@"finishedWinAnimation" object:nil];

}




-(void)animateSequence:(NSMutableArray *)colorsArray{
    
//    UIButton *aButton = [[UIButton alloc] init];
    
    NSMutableArray *animatedArray = [[NSMutableArray alloc]initWithArray:colorsArray copyItems:YES];

    NSLog(@"Sequence is %@", colorsArray);
    if ([colorsArray count]>0){
    NSString *firstColor = [animatedArray objectAtIndex:0];
    [animatedArray removeObjectAtIndex:0];
    if ([firstColor isEqualToString:@"green"]){
    [UIView animateWithDuration:0.5 animations:^{
        self.greenSquare.alpha = 1.0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            self.greenSquare.alpha = 0.5;
            [self animateSequence:animatedArray];
        }];
    }];
    }
        if ([firstColor isEqualToString:@"orange"]){
            [UIView animateWithDuration:0.5 animations:^{
                self.orangeSquare.alpha = 1.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 animations:^{
                    self.orangeSquare.alpha = 0.5;
                    [self animateSequence:animatedArray];
                }];
            }];
        }
        if ([firstColor isEqualToString:@"blue"]){
            [UIView animateWithDuration:0.5 animations:^{
                self.blueSquare.alpha = 1.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 animations:^{
                    self.blueSquare.alpha = 0.5;
                    [self animateSequence:animatedArray];
                }];
            }];
        }
        if ([firstColor isEqualToString:@"red"]){
            [UIView animateWithDuration:0.5 animations:^{
                self.redSquare.alpha = 1.0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.5 animations:^{
                    self.redSquare.alpha = 0.5;
                    [self animateSequence:animatedArray];
                }];
            }];
        }
    }
}




@end
