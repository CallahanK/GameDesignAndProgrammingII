//
//  QuitScreen.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface QuitScreen : CCLayer

+(CCScene*) scene;

-(id) init;

-(void) onQuit: (CCMenuItemFont*) button;

-(void) onBack: (CCMenuItemFont*) button;


@end
