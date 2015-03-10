//
//  Clock.h
//  Samurai
//
//  Created by Jottie Brerrin on 3/10/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol ClockDelegate <NSObject>

-(void)timesUp;

@end


@interface Clock : CCSprite {
    CCLabelTTF *_timerLabel;
}

@property int time;
@property id delegate;

-(void)incrementTime:(int)timeIncrease;

@end
