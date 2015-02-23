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
    
    self.lives = 3;
    
    possibleFlowers = @[@"Flowers/Daisy",@"Flowers/Rose"];
    self.flowerSpeed = 150;
    
    randomSequence = [[NSMutableArray alloc]init];
    
    [self createRandomDesiredSequence:5];
    
    CCNode *destroyer = [CCBReader load:@"FlowerDestroyer"];
    destroyer.position = CGPointMake(screenSize.x/4.,-100);
    [physicsNode addChild:destroyer];
    
    barOfHearts = @[_heart1,_heart2,_heart3];
    
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
    [primary removeFromParentAndCleanup:true];
    primary = (Flower*)[CCBReader load:[randomSequence objectAtIndex:0]];
    primary.anchorPoint = CGPointMake(1, 1);
    primary.scale = .35;
    [self addChild:primary];
    primary.position = CGPointMake(screenSize.x/2.,screenSize.y/2.);
    
    //remove the secondary here
    //if there is another flower in the array, it will be redisplayed
    //else the user will see they have only one flower left
    [secondary removeFromParentAndCleanup:true];
    
    if ([randomSequence count]>1) {
        secondary = (Flower*)[CCBReader load:[randomSequence objectAtIndex:1]];
        secondary.anchorPoint = CGPointMake(1, 1);
        secondary.scale = .25;
        [self addChild:secondary];
        int flowerGap = 10;
        secondary.position = CGPointMake(screenSize.x/2.,screenSize.y/2. - primary.contentSize.height*primary.scale - flowerGap);
    }
    
}


-(void)acceptFlower:(CCSprite*)flowerSwiped{
    Flower *flowerWeWant = (Flower*)[CCBReader load:[randomSequence objectAtIndex:0]];
    Flower *flowerWeChose = (Flower*) flowerSwiped;
    
    if([[flowerWeChose getType] isEqualToString:[flowerWeWant getType]]){
        CCLOG(@"Correct accept");
        //correctly accept
        self.score += self.flowerBonus;
        [randomSequence removeObjectAtIndex:0];
    }
    else{
        CCLOG(@"Incorrect accept");
        //incorrectly accept
        [self loseLife];
    }
    
    [flowerWeChose removeFromParent];
    
    //if there's nothing left to match, the user has won
    if ([randomSequence count] == 0) {
        [self winGame];
    } else {
        [self displayFlowers];
    }
}

-(void)rejectFlower:(CCSprite*)flowerSwiped{
    Flower *flowerWeWant = (Flower*)[CCBReader load:[randomSequence objectAtIndex:0]];
    Flower *flowerWeChose = (Flower*) flowerSwiped;
    
    
    if([[flowerWeChose getType] isEqualToString:[flowerWeWant getType]]){
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

-(void)winGame{
    //disable swipes
}

-(void)loseGame{
    //disable swipes
}

-(void)loseLife{
    self.lives -= 1;
    if (self.lives < 0) {
        [self loseGame];
    } else {
        CCSprite *currentHeart = [barOfHearts objectAtIndex:self.lives];
        currentHeart.visible = false;
    }
    
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair flower:(Flower *)flower destroyer:(CCNode *)destroyer{
    [self loseLife];
    [flower removeFromParentAndCleanup:true];
    return [super ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair flower:(Flower *)flower destroyer:(CCNode *)destroyer];
}


@end
