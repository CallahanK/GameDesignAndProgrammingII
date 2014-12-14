//
//  HighScoreScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "HighScoreScreen.h"
#import "MainScreen.h"

@implementation HighScoreScreen

+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    HighScoreScreen* highScoreScreen = [HighScoreScreen node];
    
    [scene addChild: highScoreScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *scoreListLabel =
        [CCMenuItemFont itemWithString:@"High Score List Here" target:self selector:@selector(onLabel:)];
        
        CCMenuItem *menuButton =
        [CCMenuItemFont itemWithString:@"Return to Menu" target:self selector:@selector(onMenu:)];
        
        CCMenu *menu = [CCMenu menuWithItems:scoreListLabel,menuButton, nil];
        
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






@end
