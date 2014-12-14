//
//  InterLevelScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "InterLevelScreen.h"
#import "GameScreen.h"

@implementation InterLevelScreen

//TODO Placeholder

+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    InterLevelScreen* interLevelScreen = [InterLevelScreen node];
    
    [scene addChild: interLevelScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenuItem *gameButton =
        [CCMenuItemFont itemWithString:@"Game" target:self selector:@selector(onGame:)];
        
        CCMenu *menu = [CCMenu menuWithItems:gameButton,backButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

- (void) onBack: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}

- (void) onGame: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[GameScreen scene]];
}



@end
