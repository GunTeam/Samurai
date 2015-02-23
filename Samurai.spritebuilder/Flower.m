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
    self.physicsBody.collisionType = @"flower";
    self.physicsBody.collisionGroup = @"flowers";
    downwardVelocity = 0;
    
    self.userInteractionEnabled = true;
        
//    //listen for swipes left
//    swipeLeft= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft)];
//    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
//    [[[CCDirector sharedDirector] view] addGestureRecognizer:swipeLeft];
//    // listen for swipes to the right
//    swipeRight= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight)];
//    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
//    [[[CCDirector sharedDirector] view] addGestureRecognizer:swipeRight];
//    // listen for swipes up
//    swipeUp= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUp)];
//    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
//    [[[CCDirector sharedDirector] view] addGestureRecognizer:swipeUp];
//    // listen for swipes down
//    swipeDown= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown)];
//    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
//    [[[CCDirector sharedDirector] view] addGestureRecognizer:swipeDown];
}

//called when there's a left swipe
- (Boolean)swipeLeft {
    [self swipe:@"left"];
//    CCLOG(@"Left swipe");
    //check if it should be rejected
    //if so, return true
    //else, return false
}

//called when there's a right swipe
- (Boolean)swipeRight {
    [self swipe:@"right"];
//    CCLOG(@"Right swipe");

    //check if it should be accepted
    //if so, return true
    //else, return false
}

//called when there's a down swipe
- (Boolean)swipeDown {
    [self swipe:@"down"];
//    CCLOG(@"Down swipe");

    //check if it's a powerup
    //if so, return true
    //else, return false
}

//called when there's an up swipe
- (Boolean)swipeUp {
    [self swipe:@"up"];
//    CCLOG(@"Up swipe");

    //check if it's an enemy
    //if so, return true
    //else, return false
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    startPoint = [touch locationInNode:self];
}

-(void)touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    endPoint = [touch locationInNode:self];
}

-(void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    CGPoint currentShotPoint =  CGPointMake(-startPoint.x + endPoint.x, -startPoint.y + endPoint.y );
    float theta = atan2f(currentShotPoint.x, currentShotPoint.y)*180./M_PI;
    CCLOG(@"%f",theta);
    if (abs(theta)>135) {
        [self swipeDown];
    } else if (theta >45){
        [self swipeRight];
    } else if (theta > -45){
        [self swipeUp];
    } else {
        [self swipeLeft];
    }
}

-(void)touchCancelled:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    CGPoint currentShotPoint =  CGPointMake(-startPoint.x + endPoint.x, -startPoint.y + endPoint.y );
    float theta = atan2f(currentShotPoint.x, currentShotPoint.y)*180./M_PI;
    CCLOG(@"%f",theta);
    if (abs(theta)>135) {
        [self swipeDown];
    } else if (theta >45){
        [self swipeRight];
    } else if (theta > -45){
        [self swipeUp];
    } else {
        [self swipeLeft];
    }
}

-(void)swipe:(NSString*)direction{
    [delegate delegateSwipe:direction withFlower:self];
    
}

-(NSString *)getType{
    return @"Flower";
}

-(void) launch{
    CGPoint velVector = CGPointMake(0, -downwardVelocity);
    self.physicsBody.velocity = velVector;
    
}

@end
