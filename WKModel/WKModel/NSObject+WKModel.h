//
//  NSObject+WKModel.h
//  WKModel
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WKModelDelegate <NSObject>

- (NSDictionary *)objectProperties;
- (NSDictionary *)arrayProperties;
- (NSDictionary *)renamedProperties;

@end

@interface NSObject (WKModel) <WKModelDelegate>

+ (instancetype)wk_modelFromDictionary:(NSDictionary *)dict;
+ (instancetype)wk_modelFromJSONString:(NSString *)str;

@end