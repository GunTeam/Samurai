//
//  Clock.m
//  Samurai
//
//  Created by Jottie Brerrin on 3/10/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Clock.h"


@implementation Clock

-(void)didLoadFromCCB{
    self.time = 30;
    self.cascadeColorEnabled = true;
    
    self.color = [CCColor colorWithCcColor3b:ccc3(0, 150, 0)];
    [self schedule:@selector(decrementTime:) interval:1.];
    [self schedule:@selector(timerFlash:) interval:1.];
}

-(void)incrementTime:(int)timeIncrease{
    if (self.time <=5 && self.time + timeIncrease > 5) {
        [self unschedule:@selector(timerFlash:)];
        [self schedule:@selector(timerFlash:) interval:.75];
        self.color = [CCColor colorWithCcColor3b:ccc3(255,232,0)];
    } else if(self.time <= 15 && self.time + timeIncrease > 15){
        [self unschedule:@selector(timerFlash:)];
        [self schedule:@selector(timerFlash:) interval:1.];
        self.color = [CCColor colorWithCcColor3b:ccc3(0,150,0)];
    }
    self.time += timeIncrease;
    _timerLabel.string = [NSString stringWithFormat:@"%d",self.time];
}

-(void)decrementTime:(CCTime)dt{
    self.time--;
    _timerLabel.string = [NSString stringWithFormat:@"%d",self.time];
    
    if (self.time == 15) {
        [self unschedule:@selector(timerFlash:)];
        [self schedule:@selector(timerFlash:) interval:.5];
        self.color = [CCColor colorWithCcColor3b:ccc3(255,232,0)];
    } else if (self.time == 5){
        [self unschedule:@selector(timerFlash:)];
        [self schedule:@selector(timerFlash:) interval:.25];
        self.color = [CCColor colorWithCcColor3b:ccc3(150,0,0)];
    } else if (self.time == 0){
        [self.delegate timesUp];
    }
}

-(void)timerFlash:(CCTime)dt{
    [self runAction:[CCActionSequence actionWithArray:@[[CCActionToggleVisibility action],[CCActionDelay actionWithDuration:.05],[CCActionToggleVisibility action]]]];
}

-(void)update:(CCTime)delta{
    
}

@end
