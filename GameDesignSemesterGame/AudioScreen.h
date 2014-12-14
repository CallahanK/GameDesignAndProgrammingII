//
//  AudioScreen.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface AudioScreen : CCLayer

+(CCScene*) scene;

-(id) init;

-(void) onSounds: (CCMenuItemFont*) button;

-(void) onMusic: (CCMenuItemFont*) button;

@end
