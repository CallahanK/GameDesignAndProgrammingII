//
//  RocketProjectile.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 12/3/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "Entity.h"
#import "Enemy.h"
#import "GameController.h"


#define VELOCITY_TERMINAL_ROCKET (VELOCITY_LAUNCH_ROCKET * 3)
#define VELOCITY_LAUNCH_ROCKET 18
#define VELOCITY_RESIDUAL 0.5
#define BOUNCE_FACTOR 0.75
#define GRAVITY_ROCKET 0.7


enum rocket_condition {
    ROCKET_ALIVE=2,
    ROCKET_EXPLODING=1,
    ROCKET_DEAD=0
};

@interface RocketProjectile : Entity {
    bool justFired;
    double vx;
    double vy;
    CGPoint initPosition;
    int moveDirection;
    enum rocket_condition rocket_condition;
}

@property(nonatomic) enum direction input;
@property(nonatomic) enum rocket_condition rocket_condition;


/** Constructor */
- (RocketProjectile*) initAt:(CGPoint) point of:(AbstractLevel*) level withDirection:(int) direction;

/** Updates Grace during the update phase */
- (void) update;

/** Moves Grace in the x direction based on input or inertially */
- (void) moveX;

/** Returns true if Grace collides with an entity (enemy or goal) */
- (bool) collidesWithEntity:(Entity *)entity;

/** Returns true if enemy collides with the level */
-(bool) collidesWithLevel;

/** Resets Grace */
- (void) remove;
@end
