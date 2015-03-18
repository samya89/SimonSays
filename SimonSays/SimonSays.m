//
//  SimonSays.m
//  SimonSays
//
//  Created by Samia Al Rahmani on 3/17/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import "SimonSays.h"


@implementation SimonSays

- (void)addToPattern {
    NSArray *colors = @[@"red", @"blue", @"orange", @"green"];
    NSUInteger randomIndex = arc4random() % [colors count];
    NSString *nextColor = colors[randomIndex];
    [self.generatedPattern addObject:nextColor];
    [self.delegate animateSequence:self.generatedPattern];
    NSLog(@"next color %@", nextColor);
}

- (void)resetRound{
    [self.generatedPattern removeAllObjects];
    [self.userPattern removeAllObjects];
    // trigger reset animation in my delegate
}


- (void)inputColor:(NSString *)color {
    [self.userPattern addObject:color];
    // compare userPattern with generatedPattern
    
    BOOL lose = NO;
    
    for (int i = 0; i < self.userPattern.count; i++) {
        if (![self.userPattern[i] isEqualToString:self.generatedPattern[i]]) {
            lose = YES;
            break;
        }
    }
    if (lose) {
    // trigger lose animation, reset games
       // [self.delegate ]
        [self.delegate animateLose];
        [self resetRound];
        
    } else {
        
        if (self.userPattern.count == self.generatedPattern.count) {
            [self.delegate animateWin];
            [self.generatedPattern addObject:color];
//            [self.delegate animateSequence:self.nextColor];
            // animate win, add to pattern, animate sequence
        }
    }
    
    
}




                                  
                                  
                                  
                                    



@end
