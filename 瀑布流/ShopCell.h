//
//  ShopCell.h
//  瀑布流
//
//  Created by jiang on 15/9/7.
//  Copyright (c) 2015年 jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShopsModel;
@interface ShopCell : UICollectionViewCell
@property(nonatomic,strong)ShopsModel * shop;
//
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;



@end
