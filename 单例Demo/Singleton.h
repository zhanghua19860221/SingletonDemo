//
//  Singleton.h
//  单例Demo
//
//  Created by 骆阳光 on 15/11/2.
//  Copyright © 2015年 骆阳光. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Singleton : NSObject

@property (nonatomic, copy) NSString * myName;
@property (nonatomic, strong) UIColor * color;

+ (Singleton *)shareSingleton;


@end
