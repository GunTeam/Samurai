//
//  HUDLayer.m
//  Samurai
//
//  Created by Jottie Brerrin on 2/9/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "HUDLayer.h"


@implementation HUDLayer

@synthesize delegate;
@synthesize flowerSpeed, score, flowerBonus;

-(id)init{
    self = [super init];
    if (self) {
        physicsNode = [[CCPhysicsNode alloc]init];
        physicsNode.collisionDelegate = self;
        [self addChild:physicsNode z:-1];
        flowerLayer = -1;
    }
    
    score = 0;
    flowerBonus = 100;
    
    return self;
}

-(void)didLoadFromCCB{
    self.userInteractionEnabled = false;
    self.multipleTouchEnabled = false;
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    
    CGFloat screenScale = [[UIScreen mainScreen]scale];

    screenSize = CGPointMake(screenBound.size.width*screenScale, screenBound.size.height*screenScale);
    
    CCLOG(@"didLoadCCB");
    CCLOG(@"width = %f",screenSize.x);
    CCLOG(@"height = %f",screenSize.y);
    
    [self schedule:@selector(spawnFlower:) interval:1];
//    Flower *flower = (Flower*)[CCBReader load:@"Flowers/Daisy"];
//    flower.position = CGPointMake(screenSize.x/2, screenSize.y/2);
//    [physicsNode addChild:flower];
}

-(void)spawnFlower:(CCTime)dt{
    flowerLayer--;
    //schedule flower spawning after some delay. This delay is to prepare the user.
    //It will be some animation or countdown. The frequency changes with whatever
    //level we're currently on. The spawn frequency scheduling is handled here, but
    //the actual spawning of the flower is handled in the individual classes
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair flower:(Flower *)flower typeB:(CCNode *)nodeB{

    
    
    return true;
}


-(void)buttonPress{
    [delegate gameOver];
}

-(void)delegateSwipe:(NSString *)direction withFlower:(CCSprite*)flower{
    CCLOG(direction);
    if([direction isEqualToString:@"left"]){
        [self rejectFlower:flower];
    }
    else if([direction isEqualToString:@"right"]){
        [self acceptFlower:flower];
    }
    else if([direction isEqualToString:@"up"]){
        [self killEnemy:flower];
    }
    else if([direction isEqualToString:@"down"]){
    [self acceptPowerUp:flower];
    }
    
}

@end
