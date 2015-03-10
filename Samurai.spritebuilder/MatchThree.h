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

@interface MatchThree : HUDLayer {
    Heart *_heart1,*_heart2,*_heart3;
    CCLabelTTF *_scoreLabel;
    CCSprite *_circle1,*_circle2,*_circle3;
    NSArray *barOfHearts;
    NSMutableArray *matchArray;
    
    
    //torn from arrangement for prototyping
    NSArray *possibleFlowers;

}

@property int lives;

@end
