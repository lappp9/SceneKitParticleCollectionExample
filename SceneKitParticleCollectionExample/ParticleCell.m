//
//  ParticleCell.m
//  SceneKitParticleCollectionExample
//
//  Created by Luke Parham on 8/12/16.
//  Copyright © 2016 Luke Parham. All rights reserved.
//

#import "ParticleCell.h"
#import "ParticleView.h"

@interface ParticleCell ()
@property (nonatomic) ParticleView *particleView;
@end

@implementation ParticleCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (!(self = [super initWithFrame:frame])) {
        return nil;
    }
    
    self.backgroundColor = [UIColor blueColor];
    _particleView = [[ParticleView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:_particleView];
    
    return self;
}

- (void)setupParticles
{
    [_particleView setupParticles];
    [self bringSubviewToFront:_particleView];
}

@end
