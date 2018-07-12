//
//  ChooseTypeController.h
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PromotionType.h"

typedef void(^ChooseTypeControllerBlock)(kPromotionType discountType);

@interface ChooseTypeController : UIViewController

@property (nonatomic, copy) ChooseTypeControllerBlock chooseTypeBlock;
@end
