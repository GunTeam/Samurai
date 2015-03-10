//
//  Samurai.m
//  Samurai
//
//  Created by Jottie Brerrin on 3/10/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Samurai.h"


@implementation Samurai

-(void)didLoadFromCCB{
    _neutral.visible = true;
    _happy.visible = false;
    _sad.visible = false;
}

-(void)happy{
    [_neutral runAction:[CCActionSequence actionWithArray:@[[CCActionToggleVisibility action],[CCActionDelay actionWithDuration:1],[CCActionToggleVisibility action]]]];
    [_happy runAction:[CCActionSequence actionWithArray:@[[CCActionToggleVisibility action],[CCActionDelay actionWithDuration:1],[CCActionToggleVisibility action]]]];
}

-(void)sad{
    [_neutral runAction:[CCActionSequence actionWithArray:@[[CCActionToggleVisibility action],[CCActionDelay actionWithDuration:1],[CCActionToggleVisibility action]]]];
    [_sad runAction:[CCActionSequence actionWithArray:@[[CCActionToggleVisibility action],[CCActionDelay actionWithDuration:1],[CCActionToggleVisibility action]]]];
}

@end
