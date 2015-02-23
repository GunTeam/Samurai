//
//  Flower.h
//  Samurai
//
//  Created by Laura Breiman on 2/5/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol FlowerDelegate <NSObject>

-(void)delegateSwipe:(NSString*)direction withFlower:(CCSprite*)flower;

@end

@interface Flower : CCSprite {
    UISwipeGestureRecognizer *swipeLeft, *swipeRight, *swipeUp,*swipeDown;
    CGPoint startPoint,endPoint;
}

-(void) didLoadFromCCB;
-(void) launch;
-(Boolean)swipeDown;

@property NSString *pattern;
@property float downwardVelocity;
@property (nonatomic, assign) id  delegate;


@end
