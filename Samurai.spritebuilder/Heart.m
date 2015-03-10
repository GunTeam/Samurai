//
//  Heart.m
//  Samurai
//
//  Created by Jottie Brerrin on 3/9/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "Heart.h"


@implementation Heart

-(void)loseHeart{
    CCActionScaleTo *scaleUp = [CCActionScaleTo actionWithDuration:.05 scale:.25];
    CCActionScaleTo *scaleDown = [CCActionScaleTo actionWithDuration:.05 scale:.1];
    CCActionTintTo *flashBright = [CCActionTintTo actionWithDuration:.08 color:[CCColor colorWithCcColor3b:ccc3(255, 255, 255)]];
    CCActionTintTo *goDark = [CCActionTintTo actionWithDuration:.08 color:[CCColor colorWithCcColor4b:ccc4(0, 0, 0,.5)]];
    [self runAction:[CCActionSequence actionWithArray:@[scaleUp,scaleDown]]];
    [self runAction:[CCActionSequence actionWithArray:@[flashBright,goDark]]];
}

-(void)gainHeart{
    CCActionScaleTo *scaleUp = [CCActionScaleTo actionWithDuration:.05 scale:.25];
    CCActionScaleTo *scaleDown = [CCActionScaleTo actionWithDuration:.05 scale:.15];
    CCActionTintTo *flashBright = [CCActionTintTo actionWithDuration:.08 color:[CCColor colorWithCcColor3b:ccc3(255, 255, 255)]];
    CCActionTintTo *goDark = [CCActionTintTo actionWithDuration:.08 color:[CCColor colorWithCcColor4b:ccc4(200,200,200,1)]];
    [self runAction:[CCActionSequence actionWithArray:@[scaleUp,scaleDown]]];
    [self runAction:[CCActionSequence actionWithArray:@[flashBright,goDark]]];
}

@end
