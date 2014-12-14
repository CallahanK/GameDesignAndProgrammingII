//
//  ScoresScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "ScoresScreen.h"

@implementation ScoresScreen



+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    ScoresScreen* scoresScreen = [ScoresScreen node];
    
    [scene addChild: scoresScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *instructLabel =
        [CCMenuItemFont itemWithString:@"Enable online high score" target:self selector:@selector(onLabel:)];
        
        CCMenuItem *localButton =
        [CCMenuItemFont itemWithString:@"Local" target:self selector:@selector(onLocal:)];
        
        CCMenuItem *onlineButton =
        [CCMenuItemFont itemWithString:@"Online" target:self selector:@selector(onOnline:)];
        
        CCMenu *menu = [CCMenu menuWithItems:instructLabel,localButton,onlineButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

//TODO add change high score location functionality
- (void) onLabel: (CCMenuItemFont*) button {
    //
}

- (void) onLocal: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}

- (void) onOnline: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}




@end
