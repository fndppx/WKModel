//
//  NSObject+WKModel.h
//  WKModel
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WKModel)

- (instancetype)initWithDictionary:(NSDictionary *)dict;

- (NSDictionary *)objectProperties;
- (NSDictionary *)arrayProperties;

@end