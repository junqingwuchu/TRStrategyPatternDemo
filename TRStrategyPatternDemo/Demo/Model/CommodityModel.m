//
//  CommodityModel.m
//  TRStrategyPattern
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import "CommodityModel.h"

@implementation CommodityModel

- (instancetype)initWithName:(NSString *)name price:(float)price{
    self = [super init];
    if (self) {
        self.name = name;
        self.price = price;
    }
    return self;
}
@end
