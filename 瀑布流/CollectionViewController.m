//
//  CollectionViewController.m
//  瀑布流
//
//  Created by jiang on 15/9/7.
//  Copyright (c) 2015年 jiang. All rights reserved.
//

#import "CollectionViewController.h"
#import "ShopCell.h"
#import "WaterflowLayout.h"
#import "ShopsModel.h"

@interface CollectionViewController ()
@property(nonatomic,strong)NSArray * dateList;
@property (weak, nonatomic) IBOutlet WaterflowLayout *layout;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layout.dataList = self.dateList;
    self.layout.columncount = 3;
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.dateList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    ShopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    cell.shop = self.dateList[indexPath.item];
    
    return cell;
}
#pragma mark - 懒加载
- (NSArray *)dateList{
    if (_dateList == nil) {
        _dateList = [ShopsModel shops];
    }
    
    return _dateList;

}

@end
