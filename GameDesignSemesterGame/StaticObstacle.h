//
//  StaticObstacle.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 11/8/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Enemy.h"

@interface StaticObstacle : Enemy

/** Comstructor */
- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_ isVert:(BOOL) tempIsVert;

/** Handles animation */
- (void) update;

@end
