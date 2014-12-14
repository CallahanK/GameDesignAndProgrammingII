//
//  OptionsScreen.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface OptionsScreen : CCLayer

+(CCScene*) scene;

-(id) init;

-(void) onBack: (CCMenuItemFont*) button;

-(void) onAudio: (CCMenuItemFont*) button;

-(void) onDifficulty: (CCMenuItemFont*) button;

-(void) onScores: (CCMenuItemFont*) button;

@end
