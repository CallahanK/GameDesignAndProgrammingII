//
//  MainScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "MainScreen.h"
#import "QuitScreen.h"
#import "OptionsScreen.h"
#import "InterLevelScreen.h"
#import "InterLevel.h"

@implementation MainScreen

+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    MainScreen* mainScreen = [MainScreen node];
    
    [scene addChild: mainScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItemFont *titleLabel = [CCMenuItemFont itemWithString:@"Kickpuncher: \n The Game"];
        
        [titleLabel setFontName:@"Helvetica"];
        
        CCMenuItem *optionsButton =
        [CCMenuItemFont itemWithString:@"Options" target:self selector:@selector(onOptions:)];
        
        CCMenuItem *quitButton =
        [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        
        newGameButton =
        [CCMenuItemFont itemWithString:@"New Game" target:self selector:@selector(onNewGame:)];
        
        resumeButton =
        [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(onResume:) ];
        
        [resumeButton setIsEnabled:false];
        
        CCMenu *menu = [CCMenu menuWithItems:titleLabel,resumeButton,newGameButton,optionsButton,quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

- (void) onQuit: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[QuitScreen scene]];
}

- (void) onOptions: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[OptionsScreen scene]];
}

- (void) onNewGame: (CCMenuItemFont*) button {
    //[[CCDirector sharedDirector] pushScene:[InterLevelScreen scene]];
    [[CCDirector sharedDirector] pushScene:[InterLevel scene]];
    [newGameButton setIsEnabled: false];
    [resumeButton setIsEnabled:true];
}

- (void) onResume: (CCMenuItemFont*) button {
    //[[CCDirector sharedDirector] popScene];
    [[CCDirector sharedDirector] pushScene:[InterLevel scene]];
}



@end
