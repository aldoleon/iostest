//
//  StViewController.h
//  iosTest
//
//  Created by Aldo Leon on 4/15/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StViewController : UIViewController<
UITableViewDataSource,
UITableViewDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *stocksTable;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@end
