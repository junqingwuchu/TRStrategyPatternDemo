//
//  ConfigPromotion.m
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import "ConfigPromotion.h"
#import "PromotionBase.h"
#import "PromotionNormal.h"
#import "PromotionDiscount.h"
#import "PromotionFull.h"
#import "PromotionReduce.h"

@implementation ConfigPromotion

+ (instancetype)promotionWithPromotionType:(kPromotionType)type{
    ConfigPromotion *promotion = [[self alloc] init];
    promotion.promotionType = type;
    return promotion;
}

- (float)getTotal:(float)price{
    
    PromotionBase * promotion = [self subPromotionWithPromotionType:self.promotionType];
    
    return [promotion configPromotionTypeWithPrice:price];
}

- (PromotionBase *)subPromotionWithPromotionType:(kPromotionType)type{
    PromotionBase * promotion = nil;
    switch (type) {
        case kPromotionTypeNormal:
            promotion = [PromotionNormal promotionWithType:type];
            break;
        case kPromotionTypeDiscount:
            promotion = [PromotionDiscount promotionWithType:type];
            break;
        case kPromotionTypeFull:
            promotion = [PromotionFull promotionWithType:type];
            break;
        case kPromotionTypeReduce:
            promotion = [PromotionReduce promotionWithType:type];
            break;
        default:
            break;
    }
    return promotion;
}
@end
