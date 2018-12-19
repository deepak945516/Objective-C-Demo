//
//  ItemTableViewCell.m
//  ObjCDemo
//
//  Created by Deepak Kumar on 02/11/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import "ItemTableViewCell.h"

@implementation ItemTableViewCell

// MARK: - Life Cycle Methods
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self initialSetup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

// MARK: - Setup Methods
- (void)initialSetup {
//    _itemImageView.image = _itemImage;
//    _itemNameLabel.text = _itemName;
    
}

//- (void)fillCellData (UIImage *) itemImage: (NSString *) itemName {
//
//}


- (IBAction)editButtonTapped:(UIButton *)sender {
    [_delegate editButtonAction:sender];
}

@end
