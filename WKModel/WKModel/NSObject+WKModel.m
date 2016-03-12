//
//  NSObject+WKModel.m
//  WKModel
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import "NSObject+WKModel.h"
#import <objc/runtime.h>

@implementation NSObject (WKModel)

+ (instancetype)wk_modelFromDictionary:(NSDictionary *)dict {
    NSObject *model = [[self alloc] init];
    [model configurePropertyWithDictionary:dict];
    return model;
}

+ (instancetype)wk_modelFromJSONString:(NSString *)str {
    NSObject *model = [[self alloc] init];
    [model configurePropertyWithDictionary:[self dictionaryFromJSONString:str]];
    return model;
}

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)jsonString {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if(error) {
        NSLog(@"JSON有误：%@", error);
    }
    return dict;
}

- (void)configurePropertyWithDictionary:(NSDictionary *)dict {
    NSArray *properties = [self properties];
    NSDictionary *objectProperties = [self dictionaryOfobjectProperties];
    NSDictionary *arrayProperties = [self dictionaryOfArrayProperties];
    
    for (NSString *key in dict) {
        if ([properties indexOfObject:key] != NSNotFound) {
            if (objectProperties[key]) {
                NSObject *obj = [[objectProperties[key] alloc] init];
                [obj configurePropertyWithDictionary:dict[key]];
                
                [self setValue:obj forKeyPath:key];
            }
            else if (arrayProperties[key]) {
                NSMutableArray *arr = [NSMutableArray array];
                for (NSDictionary *modelDict in dict[key]) {
                    NSObject *obj = [[arrayProperties[key] alloc] init];
                    [obj configurePropertyWithDictionary:modelDict];
                    
                    [arr addObject:obj];
                }
                
                [self setValue:arr forKeyPath:key];
            }
            else {
                [self setValue:dict[key] forKeyPath:key];
            }
        }
    }
}

- (NSArray *)properties {
    NSMutableArray *props = [NSMutableArray array];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(self.class, &outCount);
    for (i = 0; i < outCount; i++)
    {
        const char *char_f = property_getName(properties[i]);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        [props addObject:propertyName];
    }
    free(properties);
    
    return [props copy];
}

- (NSDictionary *)dictionaryOfobjectProperties {
    NSDictionary *dict;
    if ([self respondsToSelector:@selector(objectProperties)]) {
        dict = [self objectProperties];
    }
    return dict;
}

- (NSDictionary *)dictionaryOfArrayProperties {
    NSDictionary *dict;
    if ([self respondsToSelector:@selector(arrayProperties)]) {
        dict = [self arrayProperties];
    }
    return dict;
}

- (NSDictionary *)objectProperties {
    return nil;
}

- (NSDictionary *)arrayProperties {
    return nil;
}

@end
