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

-(void)didLoadFromCCB{
    
}

-(id)init{
    self = [super init];
    if (self) {
        physicsNode = [[CCPhysicsNode alloc]init];
        physicsNode.collisionDelegate = self;
    }
    
    return self;
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair flower:(Flower *)flower typeB:(CCNode *)nodeB{

    
    
    return true;
}


-(void)buttonPress{
    [delegate gameOver];
}

@end
