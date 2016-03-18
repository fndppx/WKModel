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
        NSDictionary *realKeyDict = [self dictionaryOfRenamedProperties];
        NSString *realKey = realKeyDict[key] ? realKeyDict[key] : key;
        if ([properties indexOfObject:realKey] != NSNotFound) {
            if (objectProperties[realKey]) {
                NSObject *obj = [[objectProperties[realKey] alloc] init];
                [obj configurePropertyWithDictionary:dict[key]];
                
                [self setValue:obj forKeyPath:realKey];
            }
            else if (arrayProperties[realKey]) {
                NSMutableArray *arr = [NSMutableArray array];
                for (NSDictionary *modelDict in dict[key]) {
                    NSObject *obj = [[arrayProperties[realKey] alloc] init];
                    [obj configurePropertyWithDictionary:modelDict];
                    
                    [arr addObject:obj];
                }
                [self setValue:arr forKeyPath:realKey];
            }
            else {
                [self setValue:dict[key] forKeyPath:realKey];
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

- (NSDictionary *)dictionaryOfRenamedProperties {
    NSDictionary *dict;
    if ([self respondsToSelector:@selector(renamedProperties)]) {
        dict = [self renamedProperties];
    }
    return dict;
}

@end
