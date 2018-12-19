//
//  ItemTableViewCell.h
//  ObjCDemo
//
//  Created by Deepak Kumar on 02/11/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import <UIKit/UIKit.h>

// Cell Button Delegate
@protocol CellButtonDelegate <NSObject>

-(void)editButtonAction: (UIButton *) sender;

@end

NS_ASSUME_NONNULL_BEGIN

@interface ItemTableViewCell : UITableViewCell

// MARK: - IBOutlets
@property(weak, nonatomic)IBOutlet UIView *backView;
@property(weak, nonatomic)IBOutlet UIImageView *itemImageView;
@property(weak, nonatomic)IBOutlet UILabel *itemNameLabel;
@property(weak, nonatomic)IBOutlet UIButton *editButton;

// MARK: - Variables
@property(strong, nonatomic, readwrite) UIImage *itemImage;
@property(strong, nonatomic, readwrite) NSString *itemName;
// CellButtonDelegate
@property(weak, nonatomic) id <CellButtonDelegate> delegate;
// MARK: - IBAction Declaration
- (IBAction)editButtonTapped:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
