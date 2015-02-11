//
//  HUDLayer.h
//  Samurai
//
//  Created by Jottie Brerrin on 2/9/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Flower.h"

//define the protocol for our delegate
@protocol HUDDelegate <NSObject>

-(void)gameOver;

@end


@interface HUDLayer : CCNode <CCPhysicsCollisionDelegate> {
    CCPhysicsNode *physicsNode;
}

@property (nonatomic, assign) id  delegate;

@end
