//
//  ViewController.m
//  TRStrategyPatternDemo
//
//  Created by book on 2018/7/12.
//  Copyright © 2018年 Tracky. All rights reserved.
//

#import "ViewController.h"
#import "CommodityModel.h"
#import "ChooseTypeController.h"
#import "ConfigPromotion.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (weak, nonatomic) IBOutlet UIButton *button3;

@property (weak, nonatomic) IBOutlet UIButton *button4;

@property (weak, nonatomic) IBOutlet UIButton *chooseTpyeButton;

@property (weak, nonatomic) IBOutlet UIButton *paymentButton;

@property (strong, nonatomic) NSMutableArray *commodityArray;

@property (strong, nonatomic) NSMutableArray *selArray;

@property (assign, nonatomic) kPromotionType choosedType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDatas];
    self.choosedType = kPromotionTypeNormal;
}

// 选择商品
- (IBAction)commodityChoosed:(id)sender {
    
    // 为了方便,这里每次只选择一个商品模拟
    if (self.selArray.count) {
        return;
    }
    
    UIButton *button = (UIButton *)sender;
    CommodityModel *commodity = self.commodityArray[button.tag - 1000];// 方便起见用tag值判定
    [self.selArray addObject:commodity];
    
    
    NSMutableString *dispString = [NSMutableString stringWithString:self.textView.text];
    [dispString appendFormat:@"\n  %@    单价：%.2f\n", commodity.name ,commodity.price];
    
    self.textView.text = dispString;
}

// 选择营销活动类型
- (IBAction)discountTypeChoosed:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    ChooseTypeController *chooseTypeVC = [[ChooseTypeController alloc] init];
    chooseTypeVC.chooseTypeBlock = ^(kPromotionType discountType) {
        
        weakSelf.choosedType = discountType;
        [weakSelf.chooseTpyeButton setTitle:[weakSelf stringFromDiscountType:discountType] forState:UIControlStateNormal];
        
        
        NSMutableString *dispString = [NSMutableString stringWithString:weakSelf.textView.text];
        [dispString appendFormat:@"\n选择优惠:%@\n", [weakSelf stringFromDiscountType:weakSelf.choosedType]];
        weakSelf.textView.text = dispString;
    } ;
    
    [self presentViewController:chooseTypeVC animated:YES completion:nil];
}

// 结账
- (IBAction)paymentHandle:(id)sender {
    
    if (!self.selArray.count) {
        return;
    }
    
    float realPrice = 0;

    CommodityModel *commodity = (CommodityModel *)self.selArray[0];
    
    // 这两行是关键代码
    // 创建一个抽象类,用到策略算法的控制器只需要认识这一个类就好,从而降低耦合
    ConfigPromotion * promotion = [ConfigPromotion promotionWithPromotionType:self.choosedType];
    // 计算实际要付的金额
    realPrice = [promotion getTotal:commodity.price];
    
    NSMutableString *dispString = [NSMutableString stringWithString:self.textView.text];
    [dispString appendFormat:@"\n已购商品:%@\n", commodity.name];
    [dispString appendFormat:@"\n优惠类型:%@\n", [self stringFromDiscountType:self.choosedType]];
    [dispString appendFormat:@"\n  总计:%.2f\n",commodity.price];
    [dispString appendFormat:@"  应付:%.2f\n",commodity.price];
    [dispString appendFormat:@"  实付:%.2f\n",realPrice];

    self.textView.text = dispString;
}

// 清零
- (IBAction)resetButtonHandle:(id)sender {
    self.choosedType = kPromotionTypeNormal;
    [self.selArray removeAllObjects];
    self.textView.text = @"购物车\n";
}

#pragma mark --PrivateMothod

- (void)initDatas{
    CommodityModel *commodity1 = [[CommodityModel alloc] initWithName:@"手机" price:500];
    CommodityModel *commodity2 = [[CommodityModel alloc] initWithName:@"耳机" price:236];
    CommodityModel *commodity3 = [[CommodityModel alloc] initWithName:@"纸巾" price:8.4];
    CommodityModel *commodity4 = [[CommodityModel alloc] initWithName:@"铅笔" price:1];
    
    [self.commodityArray addObject:commodity1];
    [self.commodityArray addObject:commodity2];
    [self.commodityArray addObject:commodity3];
    [self.commodityArray addObject:commodity4];
    
    [self.button1 setTitle:[NSString stringWithFormat:@"%@", commodity1.name] forState:UIControlStateNormal];
    [self.button2 setTitle:[NSString stringWithFormat:@"%@", commodity2.name] forState:UIControlStateNormal];
    [self.button3 setTitle:[NSString stringWithFormat:@"%@", commodity3.name] forState:UIControlStateNormal];
    [self.button4 setTitle:[NSString stringWithFormat:@"%@", commodity4.name] forState:UIControlStateNormal];
}

- (NSString *)stringFromDiscountType:(kPromotionType)type{
    switch (type) {
        case kPromotionTypeNormal:
            return @"普通";
            break;
        case kPromotionTypeDiscount:
            return @"8折";
            break;
        case kPromotionTypeFull:
            return @"满500减100";
            break;
        case kPromotionTypeReduce:
            return @"抹零";
            break;
        default:
            break;
    }
}

- (NSMutableArray *)commodityArray{
    if (!_commodityArray) {
        _commodityArray = [NSMutableArray array];
    }
    return _commodityArray;
}

- (NSMutableArray *)selArray{
    if (!_selArray) {
        _selArray = [NSMutableArray array];
    }
    return _selArray;
}

@end
