#import "MainScene.h"

@implementation MainScene
-(void) didLoadFromCCB{
    
}

-(void)Play{
    [[CCDirector sharedDirector]replaceScene:[CCBReader loadAsScene:@"GameScene"]];
}

@end
