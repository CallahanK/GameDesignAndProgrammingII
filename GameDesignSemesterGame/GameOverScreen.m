//
//  GameOverScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "GameOverScreen.h"
#import "MainScreen.h"
#import "HighScoreScreen.h"
#import "Score.h"

@implementation GameOverScreen

+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    GameOverScreen* gameOverScreen = [GameOverScreen node];
    
    [scene addChild: gameOverScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *gameLabel =
        [CCMenuItemFont itemWithString:@"Game Over" target:self selector:@selector(onLabel:)];
        
        NSString* gameScore = [@"Game Score: " stringByAppendingString: [NSString stringWithFormat:@"%d",[Score score]]];
        CCMenuItem *scoreLabel =
        [CCMenuItemFont itemWithString:gameScore target:self selector:@selector(onLabel:)];
        
        CCMenuItem *highScoreButton =
        [CCMenuItemFont itemWithString:@"View High Scores" target:self selector:@selector(onHighScore:)];
        
        CCMenuItem *menuButton =
        [CCMenuItemFont itemWithString:@"Return to Menu" target:self selector:@selector(onMenu:)];
        
        CCMenu *menu = [CCMenu menuWithItems:gameLabel,scoreLabel,highScoreButton,menuButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

- (void) onMenu: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[MainScreen scene]];
}

- (void) onLabel: (CCMenuItemFont*) button {
    //
}

- (void) onHighScore: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] pushScene:[HighScoreScreen scene]];
}



@end
