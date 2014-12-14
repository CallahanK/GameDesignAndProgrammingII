//
//  Level2.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 11/8/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Level2.h"
#import "Helper.h"
#import "StaticObstacle.h"


@implementation Level2

+(CCScene *) scene{
    
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Level2 *layer = [Level2 node];
	
	// add layer as a child to scene
	[scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
	return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level2 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:@"kickpuncher_level2.tmx"];
    
    if((self = [super init])) {
        bubbles = [[NSArray alloc]initWithObjects:
                   @"Caught!",@"Gotcha!",@"Take that!",@"Pow!",@"Ha, ha!",nil];
        
        feedback = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:24];
        
        [feedback setVisible:FALSE];
        
        [feedback setColor:ccc3(0,0,0)];
        
        [feedback setAnchorPoint:ccp(0,0)];
        
        // If you forget to add the feedback to the world and try to position
        // it later, cocos2d crashes
        [self addChild:feedback z:95];
    }
    
    
	return self;
}

- (void) initWorld {
    [super initWorld];
    
    CGSize size = [world mapSize];
    
    //enemiesLayer = [world layerNamed:@"enemies"];
    
    
    
    for(int tilex = 0; tilex < size.width; tilex++) {
        for(int tiley = 0; tiley < size.height; tiley++) {
            int gid = [enemiesLayer tileGIDAt:ccp(tilex,tiley)];
            
            // CGPoint here = [Helper tileToWorldX:tilex andY:tiley];
            CGPoint here = [Helper tile:ccp(tilex,tiley) toWorld:world];
            
            if(gid == RID_OBSTACLE_VERT) {
                StaticObstacle* obsVert = (StaticObstacle*) [[StaticObstacle alloc] initAt:here of:self isVert:true];
                
                [self addChild:obsVert z:90];
                
                [enemies addObject:obsVert];
            }
            else if(gid == RID_OBSTACLE_HORIZ) {
                StaticObstacle* obsHoriz = (StaticObstacle*) [[StaticObstacle alloc] initAt:here of:self isVert:false];
                
                [self addChild:obsHoriz z:90];
                
                [enemies addObject:obsHoriz];
            }
            
            
        }
    }
}

-(void) update:(ccTime)dt {
   
    [super update:dt];
    return;
}





@end
