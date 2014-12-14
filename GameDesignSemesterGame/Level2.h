//
//  Level2.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 11/8/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Level1.h"

@interface Level2 : Level1 

/** Gets a scene for this layer */
+ (CCScene *) scene;

/** Constructor */
- (id) init;

/** Initializes the world */
- (void) initWorld;

/** Updates the level */
- (void) update:(ccTime)dt;



@end
