//
//  NSObject+Runtime.m
//  runtime
//
//  Created by PatrickY on 2017/12/8.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)

+ (instancetype)pt_objWithDict:(NSDictionary *)dict {
    
    id object = [[self alloc] init];
    
    //使用字典设置对象信息
    NSArray *proList = [self pt_objProperties];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        //判断 key是否存在
        if ([proList containsObject:key]) {
            
            [object setValue:obj forKey:key];
            
        }
        
    }];
    
    return object;
}


const char *kPropertiesListKey = "PTPropertiesListKey";

+(NSArray *)pt_objProperties {
    
    //获取关联对象
    NSArray *ptyList = objc_getAssociatedObject(self, kPropertiesListKey);
    //调用运行时判断属性是否获取
    if (ptyList != nil) {
        return ptyList;
    }
    
    //调用运行时方法获得属性列表
    unsigned int count = 0;
    objc_property_t *proList = class_copyPropertyList([self class], &count);
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        
        objc_property_t pty = proList[i];
        
        const char *cName = property_getName(pty);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [arrayM addObject:name];
        
    }
    
    //释放数组
    free(proList);

    //动态创建属性
    objc_setAssociatedObject(self, kPropertiesListKey, arrayM.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return arrayM.copy;
    
}

@end
