//
//  Bouquet.h
//  Samurai
//
//  Created by Jottie Brerrin on 2/6/15.
//  Copyright 2015 Apportable. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HUDLayer.h"


@interface Bouquet : HUDLayer {
    NSMutableArray *unmatchedFlowersInThisBouquet;
}

@property double timeRemaining;
@property double timeBonus;
@property NSArray *bouquetToMatch;
@property NSArray *possibleFlowers;

@end
