//
//  StaticObstacle.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 11/8/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "StaticObstacle.h"


@implementation StaticObstacle

- (id) initAt:(CGPoint) here of:(AbstractLevel*) level_ isVert:(BOOL) tempIsVert {
    
    if (tempIsVert) {
        [super initWithFrames: @"static_obstacle_vert.png" width:16 andHeight:16];
    }
    
    else{
        [super initWithFrames: @"static_obstacle_horiz.png" width:16 andHeight:16];
    }
    
	state = STATE_ALIVE;
    
    xSpeed = 0;
	
	ySpeed = 0;
	
	if ([self toss] == 1){
        self.frameNumber=0;
    }
    else{
        self.frameNumber=1;
    }
	
	[self setPosition:here];
    
    level = level_;
	
	return self;
}

-(void) update {
	[self nextFrame];
    [super update];
}


@end
