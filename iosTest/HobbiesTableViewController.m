//
//  HobbiesTableViewController.m
//  iosTest
//
//  Created by Aldo Leon on 4/15/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import "HobbiesTableViewController.h"
#import "HobbieDetailViewController.h"

@interface HobbiesTableViewController ()

@end

@implementation HobbiesTableViewController
{
    NSArray *tableData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Aldo Leon";
    //Static Data
    tableData = [NSArray arrayWithObjects:@"Surfing", @"Cycling", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //Get the Hobbie Detail view on cell click
    HobbieDetailViewController *hobbieVC = [[HobbieDetailViewController alloc] initWith:indexPath.row];
    hobbieVC.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:hobbieVC animated:true];
}




@end
