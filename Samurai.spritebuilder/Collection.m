//
//  Collection.m
//  Samurai
//
//  Created by Jottie Brerrin on 2/6/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Collection.h"


@implementation Collection
@synthesize STARTING_LIVES, numLives, totalFlowers;

-(void) didLoadFromCCB{
    [super didLoadFromCCB];
    
    _positionTest.position = CGPointMake(.5, .5);
    
    //test flowerList
    flowerList = @{@"daisy":@10,@"rose":@10};
    
}

-(id) init{
    self = [super init];
    if (self) {
        STARTING_LIVES = 3;
        numLives = STARTING_LIVES;
        totalFlowers = 100; //how many flowers fall
    }

    
    return self;
}

-(void)spawnFlower:(CCTime)dt{
    [super spawnFlower:dt];
    //take care of custom spawning
    if (flowerList/*flowerList isn't empty*/){
        /*if there is no way to grab a random element from dict*/
        //put the keys when we initialize the dictionary
        //get a random number based upon number of keys with positive value at this timestep
        //use random number to pull from list
        //use this element to spawn flower and decrement that number in the dictionary
    }
}



@end
