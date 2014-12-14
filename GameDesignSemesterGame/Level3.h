//
//  Level3.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 11/9/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Level2.h"
#import "RocketProjectile.h"

@interface Level3 : Level2 {
    NSMutableArray* projectiles;
}
    
/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Updates the level */
- (void) update:(ccTime)dt;



@end
