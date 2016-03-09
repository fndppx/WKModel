//
//  Model.h
//  WKModel
//
//  Created by Welkin Xie on 3/9/16.
//  Copyright © 2016 WelkinXie. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Detail;

@interface Model : NSObject
@property (copy, nonatomic) NSString *name;
@property (strong, nonatomic) NSNumber *age;
@property (copy, nonatomic) NSString *phone;

@property (strong, nonatomic) Detail *detail;
@property (copy, nonatomic) NSArray *list;

@end
