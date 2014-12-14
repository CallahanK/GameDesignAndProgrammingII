//
//  MainScreen.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface MainScreen : CCLayer {
    CCMenuItem *newGameButton;
    CCMenuItem *resumeButton;
}

+(CCScene*) scene;

-(id) init;

-(void) onQuit: (CCMenuItemFont*) button;

-(void) onOptions: (CCMenuItemFont*) button;

-(void) onNewGame: (CCMenuItemFont*) button;

-(void) onResume: (CCMenuItemFont*) button;



@end
