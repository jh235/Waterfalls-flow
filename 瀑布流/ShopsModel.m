//
//  ShopsModel.m
//  瀑布流
//
//  Created by jiang on 15/9/7.
//  Copyright (c) 2015年 jiang. All rights reserved.
//

#import "ShopsModel.h"

@implementation ShopsModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self =[super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)shopWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

//读取plist文件,返回数组
+ (NSArray *) shops
{
    //  1.从plist文件中读取数据
    //   1.1 获取plist文件绝对路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"plist"];
    //   2.1 读取plist文件数据
    //  array中存放是字典
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    //  字典转模型
    //  2.1 定义一个可变数组用来存放，转换后的模型
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //  2.2 遍历array，把字典转换为模型
    for (NSDictionary *dict in array) {
        
        ShopsModel *shop  = [self shopWithDict:dict];
        //      把转换后的模型添加到数组
        [arrayM addObject:shop];
    }
    
    //  返回转换后的模型数组
    return  arrayM;
}


@end
