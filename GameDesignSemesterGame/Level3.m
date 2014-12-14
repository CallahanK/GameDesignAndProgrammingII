//
//  Level3.m
//  GameDesignSemesterGame
//
//  Created by Marist User on 11/9/14.
//  Copyright 2014 Marist User. All rights reserved.
//

#import "Level3.h"
#import "Score.h"

#define REWARD_ROCKET_ENEMY 20

@implementation Level3

+(CCScene *) scene{
    
	// 'scene' is an autorelease object.
	CCScene* scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Level3 *layer = [Level3 node];
	
	// add layer as a child to scene
	[scene addChild: layer z:25];
    
    [scene addChild: [GameController make] z:25];
    
	return scene;
}

- (id) init {
    if([self isMemberOfClass:[Level3 class]])
        world = [CCTMXTiledMap tiledMapWithTMXFile:@"kickpuncher_level3.tmx"];
    
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
    
    //CGSize size = [world mapSize];
    
    //enemiesLayer = [world layerNamed:@"enemies"];
    
    projectiles = [[NSMutableArray alloc] init];
    
    
    
    
}


-(void) update:(ccTime)dt {
    [super update:dt];
    
    if([[GameController instance] firePressed]){
        printf("Fire Pressed");        
        
        if (grace.frameNumber==0) {
            //Make new rocketfist
            RocketProjectile* rocket = [[RocketProjectile alloc] initAt:ccp(grace.x-34,grace.y) of:self withDirection:grace.frameNumber];
            
            [self addChild: rocket z: 90];
            
            [projectiles addObject:rocket];
        }
        if (grace.frameNumber==2) {
            //Make new rocketfist
            RocketProjectile* rocket = [[RocketProjectile alloc] initAt:ccp(grace.x+20,grace.y) of:self withDirection:grace.frameNumber];
            
            [self addChild: rocket z: 90];
            
            [projectiles addObject:rocket];
        }
        
        
    }

    for(RocketProjectile* projectile in projectiles) {
        [projectile update];
        
        if ([projectile collidesWithEntity:grace]) {
            [projectile remove];
        }
        for (Enemy* enemy in enemies) {
            if ([projectile collidesWithEntity:enemy] && enemy.state==STATE_ALIVE && projectile.rocket_condition==STATE_ALIVE) {
                enemy.state = STATE_DYING;
                [Score increment:REWARD_ROCKET_ENEMY];
            }
        }
    }
    
    
}





@end
