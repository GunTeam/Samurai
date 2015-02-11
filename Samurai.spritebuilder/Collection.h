//
//  Collection.h
//  Samurai
//
//  Created by Jottie Brerrin on 2/6/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HUDLayer.h"


@interface Collection : HUDLayer {
    CCSprite  *_positionTest;
    CCNode *_collectionBar;
}

@property int STARTING_LIVES;
@property int numLives;
@property int totalFlowers;


@end
