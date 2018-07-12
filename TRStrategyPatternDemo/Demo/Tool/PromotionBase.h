//
//  PromotionBase.h
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PromotionType.h"


@interface PromotionBase : NSObject

@property (assign, nonatomic) kPromotionType promotionType;


+ (instancetype)promotionWithType:(kPromotionType)type;

- (float)configPromotionTypeWithPrice:(float)price;
@end
