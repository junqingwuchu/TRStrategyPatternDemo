//
//  ChooseTypeController.m
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import "ChooseTypeController.h"

@interface ChooseTypeController ()

@end

@implementation ChooseTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)chooseTypeHandle:(id)sender {
    // 方便起见用tag值判定
    UIButton *button = (UIButton *)sender;
    kPromotionType tempType = kPromotionTypeNormal;
    switch (button.tag) {
        case 1000:
            tempType = kPromotionTypeNormal;
            break;
        case 1001:
            tempType = kPromotionTypeDiscount;
            break;
        case 1002:
            tempType = kPromotionTypeFull;
            break;
        case 1003:
            tempType = kPromotionTypeReduce;
            break;
        default:
            break;
    }
    
    if (self.chooseTypeBlock) {
        self.chooseTypeBlock(tempType);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
