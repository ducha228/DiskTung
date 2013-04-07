//
//  ViewController.h
//  Day7DiskManage
//
//  Created by ThanhTung on 3/27/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txtTitle;
@property (nonatomic,strong) UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UITextField *txtSearch;
@property (weak, nonatomic) IBOutlet UIButton *btnSearch;
- (IBAction)search:(id)sender;

@end
