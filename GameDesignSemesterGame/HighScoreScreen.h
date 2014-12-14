//
//  HighScoreScreen.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface HighScoreScreen : CCLayer

+(CCScene*) scene;

-(id) init;

-(void) onLabel: (CCMenuItemFont*) button;

-(void) onMenu: (CCMenuItemFont*) button;

@end
