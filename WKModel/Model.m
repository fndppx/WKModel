//
//  Model.m
//  WKModel
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import "Model.h"
#import "Detail.h"

@implementation Model

- (NSDictionary *)objectProperties {
    return @{@"detail":[Detail class]};
}

- (NSDictionary *)arrayProperties {
    return @{@"list":[Detail class]};
}

@end
