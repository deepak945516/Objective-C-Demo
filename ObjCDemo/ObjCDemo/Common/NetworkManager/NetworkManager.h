//
//  NetworkManager.h
//  ObjCDemo
//
//  Created by Deepak Kumar on 11/12/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+ (void)callApi: (NSString *)apiName completion:(void (^)(NSData *data))onSuccess;

@end

NS_ASSUME_NONNULL_END
