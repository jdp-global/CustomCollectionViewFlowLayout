//
//  CollectionViewController.h
//  CustomPositionLayoutExample
//
//  Created by Denys Telezhkin on 01.03.13.
//  Copyright (c) 2013 Denys Telezhkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShinyCollectionViewFlowLayout.h"

@interface CollectionViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>{
    ShinyCollectionViewFlowLayout *flowLayout;
}
@property (retain, nonatomic)  UICollectionView *collectionView;


@end
