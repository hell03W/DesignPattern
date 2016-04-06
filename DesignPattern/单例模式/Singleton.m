//
//  TestSingleInstance.m
//  单例模式
//
//  Created by he on 15/11/19.
//  Copyright (c) 2015年 wandels. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *instance = nil;

+(instancetype)shareSingleton_
{
    static dispatch_once_t pOnce;
    dispatch_once(&pOnce, ^{
        instance = [[[self class] alloc] init];
    });
    return instance;
}

+ (instancetype)shareSingleton
{
    if (instance == nil) {
        @synchronized(self){
            if (instance == nil) {
                instance = [[[self class] alloc] init];
            }
        }
    }
    return instance;
}

+ (instancetype)new
{
    if (instance == nil) {
        @synchronized(self) {
            if (instance == nil) {
                instance = [[[self class] alloc] init];
            }
        }
    }
    return instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (instance == nil) {
        @synchronized(self){
            if (instance == nil) {
                instance = [super allocWithZone:zone];
            }
        }
    }
    return instance;
}

- (id)copyWithZone:(id)zone
{
    return instance;
}

- (id)mutableCopyWithZone:(id)zone
{
    return instance;
}

@end

