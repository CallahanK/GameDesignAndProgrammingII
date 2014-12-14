//
//  InterLevelScreen.h
//  GameDesignSemesterGame
//
//  Created by Marist User on 10/9/14.
//  Copyright (c) 2014 Marist User. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface InterLevelScreen : CCLayer

//TODO Placeholder to test new game button function
+(CCScene*) scene;

-(id) init;

-(void) onBack: (CCMenuItemFont*) button;

-(void) onGame: (CCMenuItemFont*) button;



@end
