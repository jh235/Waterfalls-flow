//
//  WaterflowLayout.m
//  瀑布流
//
//  Created by jiang on 15/9/7.
//  Copyright (c) 2015年 jiang. All rights reserved.
//

#import "WaterflowLayout.h"
#import "ShopsModel.h"

@interface WaterflowLayout ()

/// 记录所有 cell 的布局属性数组
@property (nonatomic, strong) NSArray *layoutAttributes;

@end

@implementation WaterflowLayout

//准备布局,设置布局的初始属性
- (void)prepareLayout{
    NSLog(@"%@",NSStringFromCGSize( self.collectionViewContentSize));
    
    //显示内容的宽度 = 总宽度减去-左右的边距
    CGFloat contentW = self.collectionViewContentSize.width - self.sectionInset.left - self.sectionInset.right;
    
    //格子的宽度
    
    //内容的宽度 - 间距 / 行数
    CGFloat itemW = (contentW - (self.columncount - 1)*self.minimumInteritemSpacing)/self.columncount;
    
    [self calaLayout:itemW];
    
}

//计算所有cell的布局

- (void)calaLayout:(CGFloat)itemW {
    
    
    
    //1.定义cell高度的数组
    CGFloat colHeight[self.columncount];
    
    //2.设置数组的初始值
    for (int i = 0; i < self.columncount ; i ++) {
        
        colHeight[i] = self.sectionInset.top;
        
    }
    //记录item的总高度
    
    CGFloat sumHight = 0;
    
    NSMutableArray *arryM = [NSMutableArray array];
    
    //遍历dataList 计算每个cell的实际高度
    
    int index = 0;
    for (ShopsModel *shop in self.dataList) {
        CGFloat itemH =[self itemH:CGSizeMake(shop.w, shop.h) itemW:itemW];
       
        sumHight += itemH;

        
        //列数
//        int col = index % self.columncount; //默认顺序
        int col = [self shortest:colHeight];  //最短列
        
        
        CGFloat X = self.sectionInset.left + col * (itemW +self.minimumInteritemSpacing);
        
        CGFloat Y = colHeight[col];
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:index inSection:0];
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexpath];
      
        attr.frame = CGRectMake(X, Y, itemW, itemH);
        
        [arryM addObject:attr];
        
        //累加对应列数的高度
        colHeight[col] += itemH + self.minimumLineSpacing;
        
        index++;

    }
    //计算 itemSize
    
    self.itemSize = CGSizeMake(itemW, sumHight/self.dataList.count);
    
    self.layoutAttributes = arryM.copy;


}

//计算最短列
- (int)shortest:(CGFloat *)colHeights{
    CGFloat max = MAXFLOAT;
    int col = 0;
    
    for (int i = 0; i < self.columncount ; i ++) {
        if (colHeights[i] < max) {
            max = colHeights[i];
            col = i;
        }

    }
    return col;
}

// size 是初始大小 计算缩放比例
- (CGFloat)itemH:(CGSize)size itemW:(CGFloat)itemW {
    return size.height * itemW / size.width;
}

//返回 rect 区域对应的de所有 cell 的布局属性

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.layoutAttributes;
}

@end
