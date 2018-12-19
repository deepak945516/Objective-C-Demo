//
//  NetworkManager.m
//  ObjCDemo
//
//  Created by Deepak Kumar on 11/12/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager
// API URL String
NSString *urlString = @"https://api.nytimes.com/svc/topstories/v2/sports.json?api-key=ef81e01863cd4083b327f1a9ff6a9317";

// CALL API Method
+ (void)callApi:(NSString *)apiName completion:(void (^)(NSData *data))onSuccess {
//    // URL Request
//    NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString: urlString]];
//    [urlRequest setHTTPMethod: @"GET"];
//    // Session
//    NSURLSession *session = [NSURLSession sharedSession];
//    // Data Task
//    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError * error) {
//        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
//        // Check response status
//        if(httpResponse.statusCode == 200) {
////            NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:data options:0 error: nil];
////            NSLog(@"Response Dictionary is - %@", responseDict);
//            onSuccess(data);
//        } else {
//            NSLog(@"API Call Error - %@", error.localizedDescription);
//        }
//    }];
//    [dataTask resume];


    // OR OR OR OR OR
    NSData *responseData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
    onSuccess(responseData);
}

@end
