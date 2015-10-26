//
//  ShopsModel.h
//  瀑布流
//
//  Created by jiang on 15/9/7.
//  Copyright (c) 2015年 jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShopsModel : NSObject
@property(nonatomic,copy)NSString * img;
@property(nonatomic,copy)NSString * price;
@property(nonatomic,assign)float w;
@property(nonatomic,assign)float h;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)shopWithDict:(NSDictionary *)dict;
//定义一个数组,加载plist文件
+(NSArray *)shops;

@end
