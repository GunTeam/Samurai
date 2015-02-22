//
//  Arrangement.m
//  Samurai
//
//  Created by Jottie Brerrin on 2/6/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Arrangement.h"


@implementation Arrangement


-(void) didLoadFromCCB{
    [super didLoadFromCCB];
    
    possibleFlowers = @[@"Flowers/Daisy",@"Flowers/Rose"];
    self.flowerSpeed = 150;
    
}
-(void)spawnFlower:(CCTime)dt{
    [super spawnFlower:dt];
    //take care of custom spawning
    
    
    int numPossibleFlowers = [possibleFlowers count];
    int flowerSpawnFlag = arc4random()%numPossibleFlowers;
    NSString *flowerToSpawn = [possibleFlowers objectAtIndex:flowerSpawnFlag];
    
    
    Flower *flower = (Flower*)[CCBReader load:flowerToSpawn];
    flower.position = CGPointMake(screenSize.x/4.,screenSize.y/1.8);
    flower.delegate = self;
    [physicsNode addChild:flower z:flowerLayer];
    [flower setDownwardVelocity: self.flowerSpeed];
    [flower launch];
}




@end
