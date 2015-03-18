//
//  SimonSays.h
//  SimonSays
//
//  Created by Samia Al Rahmani on 3/17/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ViewController;

@protocol SimonDelegate<NSObject>

- (void)animateLose;
// animate Win (All squares blink x3)

-(void)animateWin;
// animate Lose (All squares blink x1)

-(void)animateSequence:(NSMutableArray *)colorsArray;
// animate generated color sequence

@end


@interface SimonSays : NSObject

@property (nonatomic, weak) id<SimonDelegate>delegate;

@property (nonatomic, strong) NSMutableArray *generatedPattern;
@property (nonatomic, strong) NSMutableArray *userPattern;


- (void)addToPattern;

- (void)resetRound;

//- (void)startRound;

- (void)inputColor:(NSString *)color;






@end
