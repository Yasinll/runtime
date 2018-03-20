//
//  NSObject+Runtime.h
//  runtime
//
//  Created by PatrickY on 2017/12/8.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

+ (instancetype)pt_objWithDict:(NSDictionary *)dict;

+ (NSArray *)pt_objProperties;

@end
