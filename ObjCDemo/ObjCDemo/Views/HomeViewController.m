//
//  HomeViewController.m
//  ObjCDemo
//
//  Created by Deepak Kumar on 02/11/18.
//  Copyright © 2018 deepak. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import "ItemTableViewCell.h"
#import "NetworkManager.h"
//#import "NSTEasyJSON.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface HomeViewController() // this is an extension of HomeViewController interface(HomeViewController.h)
// you can add IBOutlets here or in the HomeViewController.h file
#pragma Properties
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
@property (weak, nonatomic) IBOutlet UITableView *itemTableView;
// array declaration
@property (strong, nonatomic) NSMutableArray *myColors;
@property (weak, nonatomic) NSArray *sortedColorArray;

// dictionary
@property (weak, nonatomic) NSMutableDictionary *userDict;

@property(strong, nonatomic) NSMutableDictionary *newsDictionary;
@property(strong, nonatomic) UIActivityIndicatorView *activityView;

@end

@implementation HomeViewController

#pragma mark - Variables
bool isProfileButtonSelected = false;
NSInteger isLikeyArray[100] = {0};

#pragma mark - Life Cycle Methods
-(void)viewDidLoad {
    [super viewDidLoad];
    [self initialSetup]; // Bracket notation is used only for methods
    //self.initialSetup; // Warning use dot notation only for properties not fot methods
    [self layoutSetup];
}

#pragma mark - Setup Method
-(void)initialSetup {
    _itemTableView.rowHeight = UITableViewAutomaticDimension;
    _itemTableView.estimatedRowHeight = 100;
    // API_CALL
    [self showActivityIndicator];
    [self homeApiCall];
    _titleLabel.text = @"News";
    NSLog(@"Hi");
    printf("hello printf-------------");
    // array initialization
    _myColors = [NSMutableArray arrayWithObjects:@"Red", @"Blue", @"Green", nil];
    NSInteger count = [_myColors count];
    NSLog(@"Array count = %lu", count);
    // print all the elements of the array
    for(int i = 0; i < count; i++) {
        NSLog(@"Element %i = %@", i, [_myColors objectAtIndex: i]);
    }
    [_myColors addObject: @"Yellow"];
    // another way to print to all the element of the array
    for(NSMutableString *color in _myColors) {
        NSLog(@"Color = %@", color);
    }

    _sortedColorArray = [_myColors sortedArrayUsingSelector: @selector(localizedCaseInsensitiveCompare:)];
    // print sorted array
    NSLog(@"Sorted array-----------------------------------");
    for(NSString *color in _sortedColorArray) {
        NSLog(@"Color = %@", color);
    }

    // DICTIONARY
    NSLog(@"DICTIONARY-------------------------");
    //_userDict = [NSMutableDictionary dictionary];
//    [_userDict setValue: @"Vaishali" forKey: @"deepak"];
//    [_userDict setValue: @"Noida" forKey: @"vivek"];

    _userDict = [NSMutableDictionary dictionaryWithObjectsAndKeys: @"Ghaziabad", @"deepak", @"Noida", @"vivek", nil];

    [_userDict setObject: @"Gurugram" forKey: @"Nitish"];
    NSLog(@"Dict Value = %@", [_userDict objectForKey: @"deepak"]);
    NSLog(@"Dict Value = %@", [_userDict objectForKey: @"nitish"]);

}

 -(void)layoutSetup {
     [_itemTableView registerNib:[UINib nibWithNibName: @"ItemTableViewCell" bundle: nil] forCellReuseIdentifier: @"id"];
}

// MARK: - API Call
-(void)homeApiCall {
    [NetworkManager callApi:@"home" completion:^(NSData *data) {
        //NSTEasyJSON *easyJson = [NSTEasyJSON withData:data];
        //NSLog(easyJson);
        self->_newsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: nil];
        // reload table data
        dispatch_async(dispatch_get_main_queue(), ^{
            [self->_itemTableView reloadData];
            [self->_activityView stopAnimating];
        });

        // OR
        dispatch_async(dispatch_get_main_queue(), ^(void) {

        });
        //NSString *caption = self->_newsDictionary[@"results"][0][@"multimedia"][0][@"caption"];
    }];
}

// Show Activity Indicator
-(void)showActivityIndicator {
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat screenHeight = UIScreen.mainScreen.bounds.size.height;
    CGFloat activityWidth = _activityView.frame.size.width;
    CGFloat activityHeight = _activityView.frame.size.height;
    [_activityView setFrame:CGRectMake((screenWidth / 2 - activityWidth / 2 ), (screenHeight / 2 - activityHeight / 2), activityWidth, activityHeight)];
    [self.view addSubview:_activityView];
    [_activityView hidesWhenStopped];
    [_activityView startAnimating];
}

-(void)showAlert:(NSString *)title withMessage:(NSString *)message isCancel:(BOOL)cancel buttonAction:(void (^)(UIAlertAction *alertButtonAction))onClick {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction* okAction) {
        onClick(okAction);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction* cancelAction) {
        onClick(cancelAction);
    }];
    if(cancel) {
        [alertController addAction:cancelAction];
    }
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

# pragma mark - IBAction Methods

- (IBAction)profileButtonTapped:(UIButton *)sender {
    if (isProfileButtonSelected) {
        _itemTableView.backgroundColor = [UIColor whiteColor];
    } else {
        _itemTableView.backgroundColor = [UIColor blackColor];
    }
    isProfileButtonSelected = !isProfileButtonSelected;
}

# pragma mark - TableViewDataSource Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self->_newsDictionary[@"results"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //default table view cell
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: nil];
//    cell.imageView.image = [UIImage imageNamed: @"note"];
//    cell.textLabel.text = [_myColors objectAtIndex: indexPath.row];

    // custom cell

    //ItemTableViewCell *cell = [[ItemTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"id"];
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"id"];
    if (!cell) {
        [tableView dequeueReusableCellWithIdentifier: @"id"];
    }
    //delegate
    cell.delegate = self;
    [cell.itemImageView sd_setImageWithURL:[NSURL URLWithString: [self->_newsDictionary[@"results"] objectAtIndex: indexPath.row][@"multimedia"][0][@"url"]]];
    cell.itemNameLabel.text = [self->_newsDictionary[@"results"] objectAtIndex: indexPath.row][@"multimedia"][0][@"caption"];
    if([cell.itemNameLabel.text  isEqual: @""]) {
        cell.itemNameLabel.text = @"Views are the fundamental building blocks of your app's user interface, and the UIView class defines the behaviors that are common to all views.";
    }
    // set tag to index
    if(isLikeyArray[indexPath.row] == 1) {
        cell.editButton.selected = YES;
    } else {
        cell.editButton.selected = NO;
    }
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 100;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName: @"Main" bundle: nil];
    DetailViewController *detailViewController = [mainStoryboard instantiateViewControllerWithIdentifier: @"DetailViewController"];
    //detailViewController.title = @"Hi"; // default title
    detailViewController.caption = [self->_newsDictionary[@"results"] objectAtIndex: indexPath.row][@"multimedia"][0][@"caption"];
    detailViewController.imageUrl = [self->_newsDictionary[@"results"] objectAtIndex: indexPath.row][@"multimedia"][1][@"url"];
    [self.navigationController pushViewController: detailViewController animated: true];
}

// Delegate method is implemented here
// It is like button
- (void)editButtonAction:(UIButton *)sender {
    NSLog(@"Edit button tapped------------");
    CGPoint buttonCGPoint = [sender convertPoint:sender.bounds.origin toView:_itemTableView];
    NSIndexPath *indexPath = [_itemTableView indexPathForRowAtPoint:buttonCGPoint];
    //ItemTableViewCell *tappedButtomCell = [_itemTableView cellForRowAtIndexPath:indexPath];
    if(sender.isSelected) {
        isLikeyArray[indexPath.row] = 0;
    } else {
        isLikeyArray[indexPath.row] = 1;
    }
    [_itemTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
    //[self.itemTableView reloadData];

//    NSString *message = [NSString stringWithFormat:@"You have seleceted the index: - %li", (long)indexPath.row];
//    // Show alertAction
//    [self showAlert:@"ObjDemo" withMessage:message isCancel:NO buttonAction:^(UIAlertAction *action) {
//
//    }];
}

@end
