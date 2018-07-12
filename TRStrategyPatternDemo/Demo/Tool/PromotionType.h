//
//  PromotionType.h
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  营销活动类型,这里用了枚举,项目中根据需要可以生成不同的活动类型类代替枚举
 */
typedef NS_ENUM(NSUInteger, kPromotionType) {
    kPromotionTypeNormal     = 0,// 普通,无优惠
    kPromotionTypeDiscount   = 1,// 打折活动
    kPromotionTypeFull       = 2,// 满减活动
    kPromotionTypeReduce     = 3 // 抹零优惠活动
};


@interface PromotionType : NSObject

@end
