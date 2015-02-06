//
//  Flower.h
//  Samurai
//
//  Created by Laura Breiman on 2/5/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Flower : CCSprite {
    UISwipeGestureRecognizer *swipeLeft, *swipeRight, *swipeUp,*swipeDown;
}

@property NSString *pattern;

@end
