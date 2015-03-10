//
//  MatchThree.m
//  Samurai
//
//  Created by Jottie Brerrin on 3/9/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "MatchThree.h"


@implementation MatchThree

-(void)didLoadFromCCB{
    [super didLoadFromCCB];
    
    possibleFlowers = @[@"Flowers/Lotus",@"Flowers/Rose",@"Flowers/ForgetMeNot"];
    self.flowerSpeed = 150;
    
    CCNode *destroyer = [CCBReader load:@"FlowerDestroyer"];
    destroyer.position = CGPointMake(screenSize.x/4.,-100);
    [physicsNode addChild:destroyer];
    
    self.lives = 3;
    barOfHearts = @[_heart1,_heart2,_heart3];
    
    matchArray = [[NSMutableArray alloc]init];
    
    
}

-(void)spawnFlower:(CCTime)dt{
    [super spawnFlower:dt];
    //take care of custom spawning
    
    int numPossibleFlowers = [possibleFlowers count];
    int flowerSpawnFlag = arc4random()%numPossibleFlowers;
    NSString *flowerToSpawn = [possibleFlowers objectAtIndex:flowerSpawnFlag];
    
    
    Flower *flower = (Flower*)[CCBReader load:flowerToSpawn];
//    Flower *flower = (Flower*)[CCBReader load:@"Flowers/Lotus"];

    flower.position = CGPointMake(screenSize.x/4.,screenSize.y/1.8);
    flower.delegate = self;
    [physicsNode addChild:flower z:flowerLayer];
    [flower setDownwardVelocity: self.flowerSpeed];
    [flower launch];
}

-(void)acceptFlower:(Flower *)flowerSwiped{
    if ([matchArray count] == 0) {
        [matchArray addObject:[flowerSwiped getType]];
        //change the grey circle with an animation of some sort
    } else if ([matchArray count] == 1){
        [matchArray addObject:[flowerSwiped getType]];
        //change the grey circle with an animation
    } else {
        //if it's an all same match
        if ([matchArray objectAtIndex:0] == [matchArray objectAtIndex:1] && [matchArray objectAtIndex:1] == [flowerSwiped getType] && [matchArray objectAtIndex:0] == [flowerSwiped getType]){
            //give the player the power-up
            
        } else if /*if it's an all same match, give appropriate power-up*/([matchArray objectAtIndex:0] != [matchArray objectAtIndex:1] && [matchArray objectAtIndex:1] != [flowerSwiped getType] && [matchArray objectAtIndex:0] != [flowerSwiped getType]){
            //give the player the points
            
        } else /*it was a miss*/{
            [self loseLife];
            //do something which tells player they lost life because of bad match
        }
        [matchArray removeAllObjects];
    }
    
}



-(void)loseLife{
    self.lives -= 1;
    //lose game if no lives are left
    //don't do anything if you've already lost
    if (self.lives < 0) {
        [self loseGame];
    } else {
        Heart *currentHeart = [barOfHearts objectAtIndex:self.lives];
        [currentHeart loseHeart];
    }
    
}

@end
