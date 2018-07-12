//
//  CommodityModel.h
//  TRStrategyPattern
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommodityModel : NSObject

/**
 *  商品名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  价格
 */
@property (nonatomic, assign) float price;

/**
 *  生成实例方法
 */
- (instancetype)initWithName:(NSString *)name price:(float)price;
@end
