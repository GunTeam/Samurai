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
    
    randomSequence = [[NSMutableArray alloc]init];
    
    [self createRandomDesiredSequence:25];
    
}

-(void)createRandomDesiredSequence:(int)length{
    for (int i = 0; i<length; i++) {
        int flowerNumber = arc4random()%[possibleFlowers count];
        [randomSequence addObject:[possibleFlowers objectAtIndex:flowerNumber]];
    }
    
    [self displayFlowers];
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

-(void)displayFlowers{
    Flower *primary = (Flower*)[CCBReader load:[randomSequence objectAtIndex:0]];
    primary.anchorPoint = CGPointMake(1, 1);
    primary.scale = .25;
    [self addChild:primary];
    primary.position = CGPointMake(screenSize.x/2.,screenSize.y/2.);
    
}


-(void)acceptFlower:(CCSprite*)flowerSwiped{
    Flower *flowerWeWant = (Flower*)[CCBReader load:[randomSequence objectAtIndex:0]];
    Flower *flowerWeChose = (Flower*) flowerSwiped;
    
    if([flowerWeChose isEqual:flowerWeWant]){
        CCLOG(@"Correct accept");
        //correctly accept
        self.score += self.flowerBonus;
        [randomSequence removeObject:flowerWeWant];
    }
    else{
        CCLOG(@"Incorrect accept");
        //incorrectly accept
        [self loseLife];
    }
    
    [flowerWeChose removeFromParent];
    [self displayFlowers];
}

-(void)rejectFlower:(CCSprite*)flowerSwiped{
    Flower *flowerWeWant = (Flower*)[CCBReader load:[randomSequence objectAtIndex:0]];
    Flower *flowerWeChose = (Flower*) flowerSwiped;
    
    
    if([flowerWeChose isEqual:flowerWeWant]){
        //incorrectly rejected
        CCLOG(@"Incorrect reject");
        [self loseLife];
    }
    else{
        //correctly reject
        CCLOG(@"correct reject");
        self.score += self.flowerBonus;
    }
    
    [flowerWeChose removeFromParent];
    [self displayFlowers];

}

-(void)killEnemy:(CCSprite*)flowerSwiped{
    
}

-(void)acceptPowerUp:(CCSprite*)flowerSwiped{
    
}

-(void)loseLife{
    self.lives -= 1;
}


@end
