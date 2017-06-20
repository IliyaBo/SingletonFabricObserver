//
//  Singlton.h
//  App1706
//
//  Created by iOS-School-1 on 17.06.17.
//  Copyright © 2017 Learning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)sharedInstsnce;


@end
