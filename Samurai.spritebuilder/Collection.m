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
    
    STARTING_LIVES = 3;
    numLives = STARTING_LIVES;
    totalFlowers = 100; //how many flowers fall
}

@end
