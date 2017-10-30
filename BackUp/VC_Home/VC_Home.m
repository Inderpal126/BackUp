//
//  VC_Home.m
//  BackUp
//
//  Created by Inder on 06/09/17.
//  Copyright © 2017 Inderpal. All rights reserved.
//

#import "VC_Home.h"

@interface VC_Home (){
    NSArray * imageArray;
}

@end

@implementation VC_Home

- (void)viewDidLoad {
    [super viewDidLoad];
//    for (int i=1; i<=5; i++) {
//        for (int j=1; j<=i; j++) {
//            NSLog(@"%d",j);
//        }
//        NSLog(@"\n");
//    }
    
    imageArray = [[NSArray alloc] initWithObjects:@"contact",@"account",@"call",@"duplicate",@"phone",@"email",@"aclose", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
       return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIImageView *image_View = (UIImageView *)[cell viewWithTag:1];
    [image_View setImage:[UIImage imageNamed:[imageArray objectAtIndex:indexPath.item]]];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (IS_IPHONE_4) {
        return CGSizeMake((collectionView.frame.size.width/2.2), collectionView.frame.size.width/2.2);
    }else if (IS_IPHONE_5){
        return CGSizeMake((collectionView.frame.size.width/2.3), collectionView.frame.size.width/2.0);
    }else if (IS_IPHONE_6){
        return CGSizeMake((collectionView.frame.size.width/2.2), collectionView.frame.size.width/2.0);
    }else{
        return CGSizeMake((collectionView.frame.size.width/2.2), collectionView.frame.size.width/2.2);
    }
    return CGSizeMake((collectionView.frame.size.width/2.2), collectionView.frame.size.width/2.2);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(12, 12, 12, 12);
}

//- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    return CGSizeMake(59.0f, 59.0f);
//}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end

