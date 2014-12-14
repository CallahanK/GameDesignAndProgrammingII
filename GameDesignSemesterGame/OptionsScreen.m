//
//  OptionsScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "OptionsScreen.h"
#import "AudioScreen.h"
#import "DifficultyScreen.h"
#import "ScoresScreen.h"



@implementation OptionsScreen

+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    OptionsScreen* optionsScreen = [OptionsScreen node];
    
    [scene addChild: optionsScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenuItem *audioButton =
        [CCMenuItemFont itemWithString:@"Audio" target:self selector:@selector(onAudio:)];
        
        CCMenuItem *difficultyButton =
        [CCMenuItemFont itemWithString:@"Difficulty" target:self selector:@selector(onDifficulty:)];
        
        CCMenuItem *scoresButton =
        [CCMenuItemFont itemWithString:@"High Scores" target:self selector:@selector(onScores:)];
        
        CCMenu *menu = [CCMenu menuWithItems:audioButton,difficultyButton,scoresButton,backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

- (void) onBack: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}

- (void) onAudio: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[AudioScreen scene]];
}

- (void) onDifficulty: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[DifficultyScreen scene]];
}

- (void) onScores: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[ScoresScreen scene]];
}


@end
