//
//  GameScene.m
//  BreakingBricksGame
//
//  Created by Varun Rathi on 26/05/17.
//  Copyright © 2017 vrat28. All rights reserved.
//

#import "GameScene.h"

#define kPlayerPositionHeight 100.0

#define kScreenWidth [[[[UIScreen mainScreen] bounds] size] width]

@interface GameScene()

@property (nonatomic) SKSpriteNode * paddleNode;

@end

@implementation GameScene {
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
   }

-(instancetype)initWithSize:(CGSize)size
{
    self =[super initWithSize:size];
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    self.physicsWorld.gravity = CGVectorMake(0,0);
    self.backgroundColor = [SKColor whiteColor];
  
    [self addBallNodeWithSize:size];
    [self addPlayer:size];
    return self;
    
}


-(void)addBallNodeWithSize:(CGSize)size
{
    SKSpriteNode * ballNode = [SKSpriteNode spriteNodeWithImageNamed:@"ball"];
    ballNode.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    
    ballNode.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:ballNode.frame.size.height/2];
    
    
    
    [self addChild:ballNode];
    
    CGVector myVector = CGVectorMake(20, 20);
    [ballNode.physicsBody applyImpulse:myVector];
    ballNode.physicsBody.linearDamping = 0;
    ballNode.physicsBody.restitution = 1;
    ballNode.physicsBody.friction = 0;
    
}


-(void)addPlayer:(CGSize )size
{
     self.paddleNode = [SKSpriteNode spriteNodeWithImageNamed:@"paddle"];
    _paddleNode.position = CGPointMake(self.frame.size.width/2, kPlayerPositionHeight);
    self.paddleNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.paddleNode.frame.size];
    self.paddleNode.physicsBody.affectedByGravity = NO;
    
    self.paddleNode.physicsBody.dynamic = NO;
    [self addChild:_paddleNode];
}




-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInNode:self];
        CGPoint newPaddlePos = CGPointMake(location.x, kPlayerPositionHeight);
        
        if(newPaddlePos.x < self.paddleNode.size.width/2)
        {
            newPaddlePos.x = self.paddleNode.size.width/2;
        }
        
        else if (newPaddlePos.x >self.frame.size.width - self.paddleNode.size.width/2)
        {
            newPaddlePos.x = self.frame.size.width - self.paddleNode.size.width/2;
        }
        
        self.paddleNode.position = newPaddlePos;
    }
}

-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
