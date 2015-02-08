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

@interface GameScene : CCNode <CCPhysicsCollisionDelegate> {
    CCPhysicsNode *_physicsNode;
    CGFloat screenHeight, screenWidth;
}

-(void) didLoadFromCCB;

@property NSString *gameType;
@property float flowerSpeed;

@end
