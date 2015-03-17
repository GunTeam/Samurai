//
//  MatchThree.m
//  Samurai
//
//  Created by Jottie Brerrin on 3/9/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "MatchThree.h"


@implementation MatchThree

-(void)play{
    [super play];
    [_timer startClock];
}

-(void)didLoadFromCCB{
    [super didLoadFromCCB];
    
    self.score = 0;
    _scoreLabel.string = [NSString stringWithFormat:@"%d",self.score];
    
    possibleFlowers = @[@"Flowers/Lotus",@"Flowers/Rose",@"Flowers/ForgetMeNot"];
    self.flowerSpeed = 150;
    
    
    self.lives = 3;
    barOfHearts = @[_heart1,_heart2,_heart3];
    
    matchArray = [[NSMutableArray alloc]init];
    
    self.multiplier = 1;
    
    _timer.delegate = self;
        
}

-(void)timesUp{
    [self.delegate gameLose];
}

-(void)spawnFlower:(CCTime)dt{
    [super spawnFlower:dt];
    //take care of custom spawning
    
    int numPossibleFlowers = (int)[possibleFlowers count];
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
    [_matchBar addToDisplay:[flowerSwiped getType]];
    [flowerSwiped gatherFlower];
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
            [self.delegate samuraiHappy];
            if ([[flowerSwiped getType]  isEqual: @"Flowers/Rose"]) {
                [self addLife];
                [_matchBar showLabelWithText:@"Life!" ofColor:[CCColor colorWithCcColor3b:ccRED]];
            } else if ([[flowerSwiped getType]  isEqual: @"Flowers/Lotus"]){
                [_matchBar showLabelWithText:@"Time!" ofColor:[CCColor colorWithCcColor3b:ccYELLOW]];
                [_timer incrementTime:5];
            } else if([[flowerSwiped getType]  isEqual: @"Flowers/ForgetMeNot"]){
                [_matchBar showLabelWithText:@"LevelUp!" ofColor:[CCColor colorWithCcColor3b:ccBLUE]];
                self.multiplier++;
                self.flowerSpeed += 20;
            }
        } else if /*if it's an all same match, give appropriate power-up*/([matchArray objectAtIndex:0] != [matchArray objectAtIndex:1] && [matchArray objectAtIndex:1] != [flowerSwiped getType] && [matchArray objectAtIndex:0] != [flowerSwiped getType]){
            //give the player the points
            [self.delegate samuraiHappy];
            [_matchBar showLabelWithText:[NSString stringWithFormat:@"100x%d!",self.multiplier] ofColor:[CCColor colorWithCcColor3b:ccc3(0, 100, 0)]];
            self.score += 100 * self.multiplier;
            _scoreLabel.string = [NSString stringWithFormat:@"%d",self.score];
        } else /*it was a miss*/{
            [self loseLife];
            [_matchBar showLabelWithText:@"Bad!" ofColor:[CCColor colorWithCcColor3b:ccc3(100, 0, 0)]];
            [self.delegate samuraiSad];
            //do something which tells player they lost life because of bad match
        }
        [_matchBar clearBar];
        [matchArray removeAllObjects];
    }
    
}

-(void)rejectFlower:(Flower *)flowerSwiped{
    [flowerSwiped cutFlower];
}


-(void)addLife{
    if (self.lives <= 2) {
        Heart *heart = [barOfHearts objectAtIndex:self.lives];
        [heart gainHeart];
        self.lives++;
    } else{
        for (Heart *heart in barOfHearts){
            [heart gainHeart];
        }
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
