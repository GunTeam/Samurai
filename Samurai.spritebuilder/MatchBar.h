//
//  MatchBar.h
//  Samurai
//
//  Created by Jottie Brerrin on 3/10/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CustomLabel.h"

@interface MatchBar : CCSprite {
    CCSprite *_circle1,*_circle2,*_circle3;
    NSArray *circleArray;
    NSMutableArray *displayFlowers;
}

@property int flowerNumber;

-(void)addToDisplay:(NSString*)flowerName;
-(void)clearBar;
-(void)showLabelWithText:(NSString*)text ofColor:(CCColor*)color;

@end
