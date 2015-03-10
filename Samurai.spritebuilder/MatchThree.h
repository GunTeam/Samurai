//
//  MatchThree.h
//  Samurai
//
//  Created by Jottie Brerrin on 3/9/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HUDLayer.h"
#import "Heart.h"
#import "Flower.h"
#import "MatchBar.h"
#import "Clock.h"

@interface MatchThree : HUDLayer <ClockDelegate> {
    Heart *_heart1,*_heart2,*_heart3;
    CCLabelTTF *_scoreLabel;
    CCSprite *_circle1,*_circle2,*_circle3;
    NSArray *barOfHearts;
    NSMutableArray *matchArray;
    
    MatchBar *_matchBar;
    Clock *_timer;
    
    //torn from arrangement for prototyping
    NSArray *possibleFlowers;

}

@property int lives;
@property int multiplier;
@property int score;

@end
