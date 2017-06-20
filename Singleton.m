//
//  Singlton.m
//  App1706
//
//  Created by iOS-School-1 on 17.06.17.
//  Copyright © 2017 Learning. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton



+ (instancetype)sharedInstsnce{
    static Singleton *sharedInstance = nil;
    
    if (!sharedInstance){
        sharedInstance = [[self alloc] init];
    }
    
    return sharedInstance;
}

@end
