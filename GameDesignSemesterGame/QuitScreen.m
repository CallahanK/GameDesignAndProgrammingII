//
//  QuitScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "QuitScreen.h"


@implementation QuitScreen

+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    QuitScreen* quitScreen = [QuitScreen node];
    
    [scene addChild: quitScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *backButton =
        [CCMenuItemFont itemWithString:@"Back" target:self selector:@selector(onBack:)];
        
        CCMenuItem *quitButton =
        [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(onQuit:)];
        CCMenu *menu = [CCMenu menuWithItems:backButton,quitButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

- (void) onQuit: (CCMenuItemFont*) button {
    exit(0);
}

- (void) onBack: (CCMenuItemFont*) button {
    [[CCDirector sharedDirector] popScene];
}

@end
