//
//  PromotionFull.m
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import "PromotionFull.h"

@implementation PromotionFull

// 满500减100
- (float)configPromotionTypeWithPrice:(float)price{
    return price >= 500 ? (price - 100) : price;
}
@end
