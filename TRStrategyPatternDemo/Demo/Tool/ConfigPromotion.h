//
//  ConfigPromotion.h
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PromotionType.h"

@interface ConfigPromotion : NSObject

@property (assign, nonatomic) kPromotionType promotionType;

/**
 *  生成实例方法
 */
+ (instancetype)promotionWithPromotionType:(kPromotionType)type;

/**
 *  获得优惠后价格
 */
- (float)getTotal:(float)price;

@end
