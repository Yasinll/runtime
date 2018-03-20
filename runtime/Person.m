//
//  Person.m
//  runtime
//
//  Created by PatrickY on 2017/12/8.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    
    NSArray *keys = @[@"name", @"age", @"title", @"height"];
    
    return [self dictionaryWithValuesForKeys:keys].description;
    
}


@end
