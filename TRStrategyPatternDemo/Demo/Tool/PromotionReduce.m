//
//  PromotionReduce.m
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import "PromotionReduce.h"

@implementation PromotionReduce

// 抹零
- (float)configPromotionTypeWithPrice:(float)price{
    return (int)price * 10 / 10;
}
@end
