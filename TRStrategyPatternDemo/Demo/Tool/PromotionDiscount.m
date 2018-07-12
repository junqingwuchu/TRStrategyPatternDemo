//
//  PromotionDiscount.m
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import "PromotionDiscount.h"

@implementation PromotionDiscount

// 打8折
- (float)configPromotionTypeWithPrice:(float)price{
    return price * 0.8;
}
@end
