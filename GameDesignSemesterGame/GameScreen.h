//
//  GameScreen.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameScreen : CCLayer

//TODO placeholder
+(CCScene*) scene;

-(id) init;

-(void) onPause: (CCMenuItemFont*) button;

-(void) onGameOver: (CCMenuItemFont*) button;

@end
