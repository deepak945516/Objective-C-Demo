//
//  DetailViewController.h
//  ObjCDemo
//
//  Created by Deepak Kumar on 02/11/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property (strong, nonatomic, readwrite) NSString *caption;
@property(strong,nonatomic,readwrite) NSString *imageUrl;

@end

NS_ASSUME_NONNULL_END
