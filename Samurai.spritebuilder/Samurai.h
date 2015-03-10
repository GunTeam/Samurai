//
//  Samurai.h
//  Samurai
//
//  Created by Jottie Brerrin on 3/10/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Samurai : CCSprite {
    CCSprite *_neutral,*_happy,*_sad;
}

-(void)happy;
-(void)sad;

@end
