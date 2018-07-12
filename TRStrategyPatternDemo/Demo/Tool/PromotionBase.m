//
//  PromotionBase.m
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import "PromotionBase.h"

@implementation PromotionBase

+ (instancetype)promotionWithType:(kPromotionType)type{
    PromotionBase *promotion = [[self alloc] init];
    promotion.promotionType = type;
    return promotion;
}

/**
 *  子类中重写此方法,根据不同优惠类型计算最终价格
 */
- (float)configPromotionTypeWithPrice:(float)price{
    /*在子类中重写此方法*/
    return 0.f;
}

@end
