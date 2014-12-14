//
//  RocketProjectile.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 12/3/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "RocketProjectile.h"
#import "Grace.h"
#import "Helper.h"

#define STEP 4

#define FACING_LEFT 1
#define FACING_RIGHT 0
#define INPUT_VERTICAL(inp) (inp == UP || inp == DOWN)

@implementation RocketProjectile
@synthesize input;
@synthesize rocket_condition;

- (RocketProjectile*) initAt:(CGPoint) point of:(AbstractLevel*) level_ withDirection:(int) direction  {
    
    [super initWithFrames: @"fist_sprite.png" width:32 andHeight:30];
    
    if(self != nil) {
        
        rocket_condition = ROCKET_ALIVE;
        
        justFired = true;
        
        self.position = initPosition = point;
        
        if (direction==2){
            self.frameNumber = FACING_RIGHT;
            moveDirection = 1;
        }
        
        if (direction==0) {
            self.frameNumber = FACING_LEFT;
            moveDirection = -1;
        }
        level = level_;
        
        vy = 0;
        
        vx = VELOCITY_LAUNCH_ROCKET*moveDirection;
        //vx = 18*moveDirection;
    }
    
    return self;
}

-(void) update {
	//if(state != STATE_ALIVE)
	//	return;
	[self moveOnCondition];
}

-(void) moveOnCondition {
	[self moveX];
	CCTMXLayer* platforms = level.platforms;
	if([self collidesWith:platforms]) {
		[self remove];
	}
    
}

-(bool) collidesWithLevel {
	return [level collidesWith: self];
}


-(bool) collidesWith:(CCTMXLayer*)layer {
    // We collide with the world if a tile is on any side
	CGRect frame = [self rect];
	int h = frame.size.height;
	
    // (Note w, h are +1 beyond the object boundary.)
	int xoffs[] = {0, 0, level.tileSize-1, level.tileSize-1};
	int yoffs[] = {0, h-1, h-1, 0};
    
    // Get grace's current position
    int x = self.x;
    int y = self.y;
    
    // Check around the four edges for collision with world
	for(int i=0; i < 4; i++) {
        CGPoint tile = [Helper world:level.world toTile:ccp(x + xoffs[i],y + yoffs[i])];
        
        if(![Helper tile:tile validIn:level.world])
            continue;
        
        // If there is a tile at the edge, we collided
        int gid = [layer tileGIDAt:tile];
        
        if(gid != 0)
            return TRUE;
	}
	
    // We found no tile at the edge so we must not be colliding
	return FALSE;
}







- (void) moveX {
	// If ball is in motion, update the velocity per gravity
    vx -= GRAVITY_ROCKET*moveDirection;
	//vx -= 0.7*moveDirection;
    
	//if(vx <= -VELOCITY_TERMINAL_ROCKET)
	//	vx = -VELOCITY_TERMINAL_ROCKET;
    
	[self moveToX: vx andY: 0];
    
    if (vx>=0) {
        self.frameNumber=FACING_RIGHT;
    }
    else
        self.frameNumber=FACING_LEFT;
    
    CCTMXLayer* platforms = level.platforms;
    
	// If we collide with the platform layer, remove
    if([self collidesWith:platforms] ) {
		[self remove];
	}
    
    return;
}

- (bool) collidesWithEntity:(Entity *)entity {
    CGRect me = CGRectMake(self.x, self.y, self.width,self.height);
    
    CGRect other = CGRectMake(entity.x, entity.y, entity.width, entity.height);
    
    bool collided = CGRectIntersectsRect(me, other);
    
    return collided;
}

- (void) remove {
    [self unschedule:@selector(remove)];
    
    rocket_condition = STATE_DEAD;
    
	[level removeChild:self cleanup:true];
}
@end
