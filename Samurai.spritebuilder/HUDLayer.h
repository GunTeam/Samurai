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


@interface HUDLayer : CCNode <CCPhysicsCollisionDelegate,FlowerDelegate> {
    CCPhysicsNode *physicsNode;
    int flowerLayer;
    CGPoint screenSize;
    CGRect *bottomRectangle;
}

@property (nonatomic, assign) id  delegate;
@property float flowerSpeed;
@property int score;
@property int flowerBonus;

-(void)didLoadFromCCB;
-(void)spawnFlower:(CCTime)dt;
-(void)acceptFlower:(CCSprite*)flowerSwiped;
-(void)rejectFlower:(CCSprite*)flowerSwiped;
-(void)killEnemy:(CCSprite*)flowerSwiped;
-(void)acceptPowerUp:(CCSprite*)flowerSwiped;
-(void)loseLife;
-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair flower:(Flower *)flower destroyer:(CCNode *)destroyer;
-(void)loseGame;

@end
