//
//  MatchBar.m
//  Samurai
//
//  Created by Jottie Brerrin on 3/10/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "MatchBar.h"


float flowerScale = .25;

@implementation MatchBar

-(void)didLoadFromCCB{
    displayFlowers = [[NSMutableArray alloc]init];
    self.flowerNumber = 0;
    circleArray = @[_circle1,_circle2,_circle3];
    
}


-(void)addToDisplay:(NSString*)flowerName{
    //create flower object to add to array
    CCSprite *flower = (CCSprite*)[CCBReader load:flowerName];
    //add it to array
    [displayFlowers addObject:flower];
    
    CCSprite *circle = [circleArray objectAtIndex:self.flowerNumber];
    circle.visible = false;
    flower.position = CGPointMake(circle.position.x*self.contentSizeInPoints.width, circle.position.y*self.contentSizeInPoints.height);
    
    flower.scale = flowerScale;
    [self addChild:flower];
    
    self.flowerNumber++;
}

-(void)clearBar{
    //see all the grey circles again
    for (CCSprite *circle in circleArray){
        circle.visible = true;
    }
    //fade those flowers out
    for (CCSprite *flower in displayFlowers){
        [flower runAction:[CCActionFadeOut actionWithDuration:.2]];
    }
    //clear the array for new flowers
    [displayFlowers removeAllObjects];
    self.flowerNumber = 0;
}

@end
