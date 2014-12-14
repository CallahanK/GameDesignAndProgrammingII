//
//  PauseScreen.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PauseScreen : CCLayer

+(CCScene*) scene;

-(id) init;

-(void) onQuit: (CCMenuItemFont*) button;

-(void) onResume: (CCMenuItemFont*) button;

-(void) onLabel: (CCMenuItemFont*) button;

@end
