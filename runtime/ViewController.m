//
//  ViewController.m
//  runtime
//
//  Created by PatrickY on 2017/12/8.
//  Copyright © 2017年 PatrickY. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+Runtime.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *properties = [Person pt_objProperties];
    
    NSLog(@"%@", properties);
    
    Person *person = [Person pt_objWithDict:@{@"name":@"Patrick",
                                              @"age":@25,
                                              @"title":@"Xiaobai",
                                              @"height":@19,
                                              @"xxx":@"yyy"}];

    NSLog(@"%@", person);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
