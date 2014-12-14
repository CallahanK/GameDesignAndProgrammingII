//
//  PauseScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "PauseScreen.h"
#import "MainScreen.h"

@implementation PauseScreen

+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    PauseScreen* pauseScreen = [PauseScreen node];
    
    [scene addChild: pauseScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *resumeButton =
        [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(onResume:)];
        
        CCMenuItem *quitButton =
        [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        CCMenuItem *pausedLabel =
        [CCMenuItemFont itemWithString:@"Paused" target:self selector:@selector(onLabel:)];
        
        CCMenu *menu = [CCMenu menuWithItems:pausedLabel,resumeButton,quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

- (void) onQuit: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[MainScreen scene]];
}

- (void) onResume: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}

- (void) onLabel: (CCMenuItemFont*) button {
    //
}


@end
