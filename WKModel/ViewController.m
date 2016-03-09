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
    
    NSDictionary *detail1 = @{@"food":@"Rice", @"drink":@"Juice"};
    NSDictionary *detail2 = @{@"food":@"Noodles", @"drink":@"Tea"};

    NSArray *arr = @[detail1, detail2];
    
    NSDictionary *dict = @{@"name":@"Welkin", @"age":@22, @"phone":@"110", @"detail":detail1, @"list":arr};
    
    Model *model = [[Model alloc] initWithDictionary:dict];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
