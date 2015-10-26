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
#import "SDPhotoBrowser.h"

@interface CollectionViewController ()<SDPhotoBrowserDelegate>
@property(nonatomic,strong)NSArray * dateList;
@property (weak, nonatomic) IBOutlet WaterflowLayout *layout;
@property(nonatomic,strong)ShopCell *cell;

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
    
    cell.shop = self.dateList[indexPath.item];
    
//    self.cell = cell;
    
    return cell;
}
#pragma mark - 图片浏览器

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSIndexPath *indexpath =
    
    self.cell = (ShopCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    
    SDPhotoBrowser *browser = [[SDPhotoBrowser alloc] init];
    browser.sourceImagesContainerView = self.collectionView; // 原图的父控件
//    browser.imageCount = 1; // 图片总数
    browser.imageCount = self.dateList.count; // 图片总数
    browser.currentImageIndex = indexPath.item;
    browser.delegate = self;
    [browser show];

}

// 返回临时占位图片（即原来的小图）
- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index
{
    return self.cell.imageView.image;
}


// 返回高质量图片的url
- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    ShopsModel *shop = self.dateList[index];
    
    NSString *urlStr = shop.img;
    return [NSURL URLWithString:urlStr];
}




#pragma mark - 懒加载
- (NSArray *)dateList{
    if (_dateList == nil) {
        _dateList = [ShopsModel shops];
    }
    
    return _dateList;

}

@end
