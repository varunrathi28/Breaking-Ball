//
//  GameScene.m
//  BreakingBricksGame
//
//  Created by Varun Rathi on 26/05/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene {
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
   }

-(instancetype)initWithSize:(CGSize)size
{
    self =[super initWithSize:size];
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsWorld.gravity = CGVectorMake(0, -1.6);
    self.backgroundColor = [SKColor whiteColor];
    SKSpriteNode * ballNode = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
    ballNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    
    ballNode.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ballNode.frame.size.height/2];
    ballNode.physicsBody.dynamic = YES;
    
    
    [self addChild:ballNode];
    
    return self;
    
}



-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
