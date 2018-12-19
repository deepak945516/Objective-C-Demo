//
//  DetailViewController.m
//  ObjCDemo
//
//  Created by Deepak Kumar on 02/11/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailViewController.m"
#import "LoginViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface DetailViewController ()

@property(weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property(weak, nonatomic) IBOutlet UITextView *newsDetailTextView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initialSetup];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event {
    //[self.navigationController popViewControllerAnimated: true];
//    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
//    LoginViewController *loginViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
//    [self.navigationController pushViewController:loginViewController animated:true];
}

- (void) initialSetup {
    _titleLabel.text = @"News";
    [_newsImageView sd_setImageWithURL:[NSURL URLWithString:_imageUrl]];
    _newsDetailTextView.text = _caption;
}

// MARK: - IBAction Methods
-(IBAction)backButtonTapped:(UIButton *) sender {
    [self.navigationController popViewControllerAnimated:true];
}

@end
