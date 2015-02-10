//
//  GameScene.h
//  Samurai
//
//  Created by Laura Breiman on 2/5/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Daisy.h"
#import "HUDLayer.h"

@interface GameScene : CCNode <CCPhysicsCollisionDelegate,HUDDelegate> {
    CCPhysicsNode *_physicsNode;
    CGFloat screenHeight, screenWidth;
    HUDLayer *_HUDLayer;
}

-(void) didLoadFromCCB;

@property NSString *gameType;
@property float flowerSpeed;

@end
