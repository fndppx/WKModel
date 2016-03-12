//
//  NSObject+WKModel.h
//  WKModel
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WKModel)

+ (instancetype)wk_modelFromDictionary:(NSDictionary *)dict;
+ (instancetype)wk_modelFromJSONString:(NSString *)str;

- (NSDictionary *)objectProperties;
- (NSDictionary *)arrayProperties;

@end