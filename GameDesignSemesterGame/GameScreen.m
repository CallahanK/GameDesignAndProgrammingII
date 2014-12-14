//
//  GameScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "GameScreen.h"
#import "PauseScreen.h"
#import "GameOverScreen.h"

@implementation GameScreen

//TODO Placeholder
+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    GameScreen* gameScreen = [GameScreen node];
    
    [scene addChild: gameScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *pauseButton =
        [CCMenuItemFont itemWithString:@"Pause" target:self selector:@selector(onPause:)];
        
        CCMenuItem *gameOverButton =
        [CCMenuItemFont itemWithString:@"Game Over" target:self selector:@selector(onGameOver:)];
        
        CCMenu *menu = [CCMenu menuWithItems:pauseButton, gameOverButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}


- (void) onPause: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[PauseScreen scene]];
}

- (void) onGameOver: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[GameOverScreen scene]];
}




@end
