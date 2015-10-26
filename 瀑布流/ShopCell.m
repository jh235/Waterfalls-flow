//
//  ShopCell.m
//  瀑布流
//
//  Created by jiang on 15/9/7.
//  Copyright (c) 2015年 jiang. All rights reserved.
//

#import "ShopCell.h"
#import "ShopsModel.h"
#import "UIImageView+WebCache.h"

@interface ShopCell ()
//@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//
//@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ShopCell


//重写set方法赋值
-(void)setShop:(ShopsModel *)shop{
    _shop = shop;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:shop.img]];
  
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",shop.price ];
 
}






@end
