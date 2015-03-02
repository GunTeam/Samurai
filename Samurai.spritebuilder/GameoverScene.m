//
//  GameoverScene.m
//  Samurai
//
//  Created by Jottie Brerrin on 3/1/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "GameoverScene.h"


@implementation GameoverScene

-(void)Retry{
    [[CCDirector sharedDirector]replaceScene:[CCBReader loadAsScene:@"GameScene"]];

}

-(void)ToMain{
    [[CCDirector sharedDirector]replaceScene:[CCBReader loadAsScene:@"MainScene"]];

}

@end
