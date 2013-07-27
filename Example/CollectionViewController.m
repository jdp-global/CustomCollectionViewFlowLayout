//
//  CollectionViewController.m
//  CustomPositionLayoutExample
//
//  Created by Denys Telezhkin on 01.03.13.
//  Copyright (c) 2013 Denys Telezhkin. All rights reserved.
//

#import "CollectionViewController.h"
#import "ShinyCollectionViewFlowLayout.h"

#import "ShinyCollectionViewFlowLayout.h"
@interface CollectionViewController ()

// Sections array. Each section is an array of items
@property (nonatomic,retain) NSMutableArray * sections;

@end

@implementation CollectionViewController

-(id)init{
    self = [super init];
    if (self!=nil) {


    }
    return self;
}
-(void)dealloc {
    self.sections = nil;
    [_collectionView release];
    [flowLayout release];
    [super dealloc];
}

-(NSMutableArray *)sections {
    if (!_sections)
        _sections = [[NSMutableArray alloc] init];
    return _sections;
}

static NSString * const kCellReuseIdentifier = @"123";
static NSString * const kHeaderReuseIdentifier = @"456";
static NSString * const kFooterReuseIdentifier = @"789";

-(void)loadView{
    [super loadView];
    
    flowLayout = (ShinyCollectionViewFlowLayout*) [[UICollectionViewFlowLayout alloc] init];

    //flowLayout = [[ShinyCollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(250, 122);
    flowLayout.minimumInteritemSpacing = 32;
    flowLayout.minimumLineSpacing = 32;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(32, 32, 32, 32);
   
    self.collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height-200) collectionViewLayout:flowLayout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView setBounces:YES];
    [self.collectionView setCollectionViewLayout:flowLayout];
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.008 green:0.102 blue:0.247 alpha:1.000]];
    [self.view addSubview:self.collectionView];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:kCellReuseIdentifier];
    
    [self.collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:kHeaderReuseIdentifier];
    
    [self.collectionView registerClass:[UICollectionReusableView class]
            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                   withReuseIdentifier:kFooterReuseIdentifier];

    // This is only done to easily switch between
    // UICollectionViewFlowLayout and ShinyCOllectionViewFlowLayout
    // Simply change layout class in IB and that's it!
    if ([flowLayout respondsToSelector:@selector(hasHeaders)])
    {
        ShinyCollectionViewFlowLayout * shinyLayout = (ShinyCollectionViewFlowLayout *)flowLayout;
        shinyLayout.hasFooters = YES;
        shinyLayout.hasHeaders = YES;
    }
    
    /* Interface builder fails to set these values in XCode 4.6, don't ask me why*/
    flowLayout.itemSize = CGSizeMake(150, 100);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 25, 10, 25);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // header and footer height value is unused in this layout example
    flowLayout.headerReferenceSize = CGSizeMake(50, 50);
    flowLayout.footerReferenceSize = CGSizeMake(50, 50);
    flowLayout.minimumInteritemSpacing = 25;
    flowLayout.minimumLineSpacing = 25;
    
    
    [self.sections addObject:@[@"1",@"2",@"3",@"4",@"5",@"6",@"1",@"2",@"3",@"4",@"5",@"6"@"1",@"2",@"3",@"4",@"5",@"6",@"1",@"2",@"3",@"4",@"5",@"6"]];
    [self.sections addObject:@[@"1",@"2",@"3",@"4",@"5",@"6", @"7"]];
      [self.sections addObject:@[@"1",@"2",@"3",@"4",@"5",@"6", @"7"]];
      [self.sections addObject:@[@"1",@"2",@"3",@"4",@"5",@"6", @"7"]];
      [self.sections addObject:@[@"1",@"2",@"3",@"4",@"5",@"6", @"7"]];
    
    [self.collectionView reloadData];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.sections count];
}

-(int)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.sections[section] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellReuseIdentifier
                                                                            forIndexPath:indexPath];
    
    //[
    if( [indexPath row] % 5){
                [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.090 green:0.612 blue:0.678 alpha:1.000]];
    }else if( [indexPath row] % 2){
             [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.851 green:0.322 blue:0.173 alpha:1.000]];
    }else if( [indexPath row] % 3){
                [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.333 green:0.208 blue:0.686 alpha:1.000]];
    }else if( [indexPath row] % 3){
        [cell.contentView setBackgroundColor:[UIColor colorWithRed:0.333 green:0.208 blue:0.686 alpha:1.000]];
    }else if( [indexPath row] % 1){
        [cell.contentView setBackgroundColor:   [UIColor colorWithRed:0.090 green:0.635 blue:0.102 alpha:1.000]];
    }else {
        [cell.contentView setBackgroundColor:  [UIColor colorWithRed:0.686 green:0.102 blue:0.247 alpha:1.000]];
    }


 
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
          viewForSupplementaryElementOfKind:(NSString *)kind
                                atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView * view = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                  withReuseIdentifier:kHeaderReuseIdentifier
                                                         forIndexPath:indexPath];
        view.backgroundColor =[UIColor colorWithRed:0.1 green:0.202 blue:0.247 alpha:1.000];
    }
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                  withReuseIdentifier:kFooterReuseIdentifier
                                                         forIndexPath:indexPath];
        view.backgroundColor =[UIColor colorWithRed:0.1 green:0.102 blue:0.247 alpha:1.000];
    }
    return view;
}


@end
