//
//  Flower.m
//  Samurai
//
//  Created by Laura Breiman on 2/5/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Flower.h"


@implementation Flower
@synthesize pattern, downwardVelocity, delegate;

-(void) didLoadFromCCB{
    CCLOG(@"Laura");
    
    self.physicsBody.collisionType = @"flower";
    self.physicsBody.collisionGroup = @"flowers";
    downwardVelocity = 0;
        
    //listen for swipes left
    swipeLeft= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [[[CCDirector sharedDirector] view] addGestureRecognizer:swipeLeft];
    // listen for swipes to the right
    swipeRight= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [[[CCDirector sharedDirector] view] addGestureRecognizer:swipeRight];
    // listen for swipes up
    swipeUp= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUp)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [[[CCDirector sharedDirector] view] addGestureRecognizer:swipeUp];
    // listen for swipes down
    swipeDown= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [[[CCDirector sharedDirector] view] addGestureRecognizer:swipeDown];
}

//called when there's a left swipe
- (Boolean)swipeLeft {
    [self swipe:@"left"];

    //check if it should be rejected
    //if so, return true
    //else, return false
}

//called when there's a right swipe
- (Boolean)swipeRight {
    [self swipe:@"right"];

    //check if it should be accepted
    //if so, return true
    //else, return false
}

//called when there's a down swipe
- (Boolean)swipeDown {
    [self swipe:@"down"];

    //check if it's a powerup
    //if so, return true
    //else, return false
}

//called when there's an up swipe
- (Boolean)swipeUp {
    [self swipe:@"up"];
    //check if it's an enemy
    //if so, return true
    //else, return false
}

-(void)swipe:(NSString*)direction{
    [delegate delegateSwipe:direction withFlower:self];
    
}

-(void) launch{
    CGPoint velVector = CGPointMake(0, -downwardVelocity);
    self.physicsBody.velocity = velVector;
    
    
    
}

@end
