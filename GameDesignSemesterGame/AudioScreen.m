//
//  AudioScreen.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/8/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import "AudioScreen.h"
#import "Options.h"
#import "SimpleAudioEngine.h"


#define THEME_SONG @"Vangelis_8_Bit.mp3"

@implementation AudioScreen


+(CCScene*) scene{
    
    CCScene* scene = [CCScene node];
    
    AudioScreen* audioScreen = [AudioScreen node];
    
    [scene addChild: audioScreen];
    
    return scene;
}


-(id) init{
    self = [super init];
    
    if(self) {
        int screenWidth = [[CCDirector sharedDirector] winSize].width;
        int screenHeight = [[CCDirector sharedDirector] winSize].height;
        
        CCMenuItem *soundsButton =
        [CCMenuItemFont itemWithString:@"Toggle Sounds" target:self selector:@selector(onSounds:)];
        
        CCMenuItem *musicButton =
        [CCMenuItemFont itemWithString:@"Toggle Music" target:self selector:@selector(onMusic:)];
        CCMenu *menu = [CCMenu menuWithItems:soundsButton,musicButton, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenWidth / 2, screenHeight*0.5f)];
        
        [self addChild:menu];
        
    }
    
    return self;
    
}

//TODO Add mute/enable sounds functionality
- (void) onSounds: (CCMenuItemFont*) button {
    
    if([Options soundsOn]) {
        [Options enableSounds:FALSE];
    }
    else {
        [Options enableSounds:TRUE];
    }
    
    [[CCDirector sharedDirector] popScene];
}

- (void) onMusic: (CCMenuItemFont*) button {
    
    if([Options musicOn]) {
        [Options enableMusic:FALSE];
        
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    }
    else {
        [Options enableMusic:TRUE];
        
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:THEME_SONG loop:true];
    }
    
    [[CCDirector sharedDirector] popScene];
}




@end
