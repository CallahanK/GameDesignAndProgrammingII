//
//  DifficultyScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "DifficultyScreen.h"

@implementation DifficultyScreen


+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    DifficultyScreen* difficultyScreen = [DifficultyScreen node];
    
    [scene addChild: difficultyScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *beginButton =
        [CCMenuItemFont itemWithString:@"Beginner" target:self selector:@selector(onBegin:)];
        
        CCMenuItem *interButton =
        [CCMenuItemFont itemWithString:@"Intermediate" target:self selector:@selector(onInter:)];
        
        CCMenuItem *advanceButton =
        [CCMenuItemFont itemWithString:@"Advanced" target:self selector:@selector(onAdvance:)];
        
        CCMenu *menu = [CCMenu menuWithItems:beginButton,interButton,advanceButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

//TODO add change difficulty functionality
- (void) onBegin: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}

- (void) onInter: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}

- (void) onAdvance: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}



@end
