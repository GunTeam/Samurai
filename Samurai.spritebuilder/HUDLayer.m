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

-(id)init{
    self = [super init];
    if (self) {
        physicsNode = [[CCPhysicsNode alloc]init];
        physicsNode.collisionDelegate = self;
        flowerLayer = -1;
    }
    
    return self;
}

-(void)didLoadFromCCB{
    
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

@end
