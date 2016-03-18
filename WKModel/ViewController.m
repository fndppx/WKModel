//
//  ViewController.m
//  WKModel
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+WKModel.h"
#import "Model.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *detail1 = @{@"food":@"Rice", @"drink":@"Juice", @"id":@"987", @"pro":@"good"};
    NSDictionary *detail2 = @{@"food":@"Noodles", @"drink":@"Tea", @"id":@"654", @"pro":@"not bad"};

    NSArray *arr = @[detail1, detail2];
    
    NSDictionary *dict = @{@"name":@"Welkin", @"age":@22, @"phone":@"110", @"Detail":detail1, @"List":arr};
    
    Model *model = [Model wk_modelFromDictionary:dict];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
