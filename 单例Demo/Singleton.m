//
//  Singleton.m
//  单例Demo
//
//  Created by 骆阳光 on 15/11/2.
//  Copyright © 2015年 骆阳光. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (Singleton *)shareSingleton {

    static Singleton *single = nil;
    
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
       
        single = [[Singleton alloc]init];
        
        
    });

    return single;
}
@end
