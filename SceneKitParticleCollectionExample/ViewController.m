//
//  ViewController.m
//  SceneKitParticleCollectionExample
//
//  Created by Luke Parham on 8/12/16.
//  Copyright © 2016 Luke Parham. All rights reserved.
//

#import "ViewController.h"
#import "ParticleCell.h"

@interface ViewController ()
@property (nonatomic) UICollectionView *collectionView;
@end

@interface ViewController (CollectionViewDelegate) <UICollectionViewDelegate, UICollectionViewDataSource>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    //Just toggle between these two lines to see the difference.
    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width/2.0 - 16, 300);
//    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width - 16, 400);
    flowLayout.sectionInset = UIEdgeInsetsMake(8, 8, 8, 8);
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [_collectionView registerClass:[ParticleCell class] forCellWithReuseIdentifier:@"ParticleCell"];
    _collectionView.backgroundColor = [UIColor redColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    
    [self.view addSubview:_collectionView];
}

@end

@implementation ViewController (CollectionViewDelegate)

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ParticleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ParticleCell" forIndexPath:indexPath];
    [cell setupParticles];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

@end
