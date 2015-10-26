//
//  WaterflowLayout.h
//  瀑布流
//
//  Created by jiang on 15/9/7.
//  Copyright (c) 2015年 jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterflowLayout : UICollectionViewFlowLayout

//数据数组
@property(nonatomic,strong)NSArray * dataList;
//列数
@property(nonatomic,assign)int columncount;
@end
