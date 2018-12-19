//
//  HomeViewController.h
//  ObjCDemo
//
//  Created by Deepak Kumar on 02/11/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController: UIViewController <UITableViewDataSource, UITableViewDelegate, CellButtonDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

NS_ASSUME_NONNULL_END
