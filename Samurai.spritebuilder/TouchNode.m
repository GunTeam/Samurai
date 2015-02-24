//
//  TouchNode.m
//  Samurai
//
//  Created by Jottie Brerrin on 2/24/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "TouchNode.h"


@implementation TouchNode

@synthesize delegate;

-(id)init{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = true;
    }

    return self;
}

-(void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    [delegate touchBegan:touch withEvent:event];
    
    
}

-(void)touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    [delegate touchMoved:touch withEvent:event];
}

-(void)touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    [delegate touchEnded:touch withEvent:event];
}

-(void)touchCancelled:(CCTouch *)touch withEvent:(CCTouchEvent *)event{
    [delegate touchCancelled:touch withEvent:event];
}

@end
