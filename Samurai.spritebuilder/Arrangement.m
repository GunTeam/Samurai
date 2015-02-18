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
    possibleFlowers = @["daisy"];
    
}

-(void)spawnFlower:(CCTime)dt{
    [super spawnFlower:dt];
    //take care of custom spawning
    
    
    
    NSString flowerToSpawn =
    Flower *flower = (Flower*)[CCBReader load:flowerToSpawn];
    
    [self addChild: flower z:flowerLayer];
    flowerLayer--;
}

@end
