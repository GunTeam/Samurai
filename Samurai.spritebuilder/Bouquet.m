//
//  Bouquet.m
//  Samurai
//
//  Created by Jottie Brerrin on 2/6/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Bouquet.h"


@implementation Bouquet

-(id)initWithTime:(double)timeRemaining{
    if ((self = [super init])) {
        self.timeRemaining = timeRemaining;
    }
    return self;
}

@end
