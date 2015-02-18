//
//  Arrangement.h
//  Samurai
//
//  Created by Jottie Brerrin on 2/6/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HUDLayer.h"

@interface Arrangement : HUDLayer {
    NSArray *possibleFlowers;
    CCSprite *_heart1,*_heart2,*_heart3;
}

@property int lives;

@end
