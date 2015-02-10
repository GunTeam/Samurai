//
//  GameScene.m
//  Samurai
//
//  Created by Laura Breiman on 2/5/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

-(void) didLoadFromCCB{
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    
    _physicsNode.collisionDelegate = self;
    self.flowerSpeed = 0.5;
    [self addFlower];
}

-(void) update:(CCTime)delta{

}

-(void) addFlower{
    Daisy *daisy = (Daisy*)[CCBReader load:@"Daisy"];
    daisy.position = CGPointMake(screenWidth/2.,screenHeight);
    [daisy setDownwardVelocity: self.flowerSpeed];
    [daisy launch];
    [_physicsNode addChild:daisy];
}


@end
