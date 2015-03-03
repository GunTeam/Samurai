//
//  GameScene.m
//  Samurai
//
//  Created by Laura Breiman on 2/5/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import "GameScene.h"


@implementation GameScene

-(void) didLoadFromCCB{
    self.userInteractionEnabled = false;
    self.multipleTouchEnabled = false;
    
    CGRect screenBound = [[UIScreen mainScreen] bounds];
    CGSize screenSize = screenBound.size;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    
    _physicsNode.collisionDelegate = self;
    _physicsNode.debugDraw = true;
    
    _HUDLayer.delegate = self;
    
}

-(void) update:(CCTime)delta{

}

-(void) addFlower{
    
}

-(void)gameLose{
    [[CCDirector sharedDirector]replaceScene:[CCBReader loadAsScene:@"GameOver"]];
}

-(void)gameWin{
    [[CCDirector sharedDirector]replaceScene:[CCBReader loadAsScene:@"GameOver"]];
}

@end
