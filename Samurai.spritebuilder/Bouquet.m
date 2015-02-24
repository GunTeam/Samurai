//
//  Bouquet.m
//  Samurai
//
//  Created by Jottie Brerrin on 2/6/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Bouquet.h"


@implementation Bouquet
@synthesize timeBonus, timeRemaining, possibleFlowers, bouquetToMatch;

-(void) didLoadFromCCB{
    [super didLoadFromCCB];
    
    self.timeRemaining = 45;
    self.timeBonus = 5; //added time per flower correctly placed

    possibleFlowers = @[@"Flowers/Daisy",@"Flowers/Rose"];
    self.flowerSpeed = 150;
    unmatchedFlowersInThisBouquet = bouquetToMatch;
}

-(id)initWithTime:(double)timeRemaining{
    if ((self = [super init])) {
        self.timeRemaining = timeRemaining;
    }
    return self;
}

-(NSArray*) getBouquetToMatch{
    return bouquetToMatch;
}

-(void) setBouquetToMatch:(NSArray *)bouquetToMatch{
    self.bouquetToMatch = bouquetToMatch;
    unmatchedFlowersInThisBouquet = bouquetToMatch;
}

-(void)acceptFlower:(CCSprite*)flowerSwiped{
    Flower *flowerWeChose = (Flower*) flowerSwiped;
    NSString *flowerString = [flowerWeChose getType];
    
    if([unmatchedFlowersInThisBouquet containsObject:flowerString]){
        CCLOG(@"Correct accept");
        //correctly accept
        self.score += self.flowerBonus;
        self.timeRemaining += self.timeBonus;
        [unmatchedFlowersInThisBouquet removeObject:flowerString];
    }
    else{
        CCLOG(@"Incorrect accept");
        //incorrectly accept
    }
    
    [flowerWeChose removeFromParent];
    
}

-(void)rejectFlower:(CCSprite*)flowerSwiped{
    Flower *flowerWeChose = (Flower*) flowerSwiped;
    NSString *flowerString = [flowerWeChose getType];

    if([unmatchedFlowersInThisBouquet containsObject:flowerString]){
        //incorrectly rejected
        CCLOG(@"Incorrect reject");
    }
    else{
        //correctly reject
        CCLOG(@"correct reject");
        self.score += self.flowerBonus;
    }
    
    [flowerWeChose removeFromParent];
}

-(void)killEnemy:(CCSprite*)flowerSwiped{
    
}

-(void)acceptPowerUp:(CCSprite*)flowerSwiped{
    
}

@end
