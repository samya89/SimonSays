//
//  ViewController.h
//  SimonSays
//
//  Created by Samia Al Rahmani on 3/17/15.
//  Copyright (c) 2015 Samia Al Rahmani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimonSays.h"

@interface ViewController : UIViewController<SimonDelegate>

@property (strong, nonatomic) SimonSays *simon;





@end

