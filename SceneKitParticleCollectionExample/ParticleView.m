//
//  ParticleView.m
//  SceneKitParticleCollectionExample
//
//  Created by Luke Parham on 8/12/16.
//  Copyright © 2016 Luke Parham. All rights reserved.
//

#import "ParticleView.h"

@interface ParticleView ()
@property (nonatomic) SCNParticleSystem *particleSystem;
@end

@implementation ParticleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }
    self.clipsToBounds = YES;
    
    return self;
}

- (void)setupParticles
{
    _particleSystem = [SCNParticleSystem particleSystemNamed:@"particles_test" inDirectory:nil];
    
    self.scene = [[SCNScene alloc] init];
    
    SCNNode *node = [[SCNNode alloc] init];
    node.position = SCNVector3Zero;
    node.geometry = [SCNBox boxWithWidth:1.0 height:100.0 length:1.0 chamferRadius:0.0];
    
    [node addParticleSystem:_particleSystem];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        [self prepareObjects:@[node] withCompletionHandler:^(BOOL success) {
            [self.scene.rootNode addChildNode:node];
        }];
    });
}

@end
