//
//  StViewController.m
//  iosTest
//
//  Created by Aldo Leon on 4/15/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import "StViewController.h"
#import "DataSource.h"
#import "StockCell.h"
#import "FullStock.h"
#import "StockEntity.h"
#import "LocationType.h"
#import "ProductEntity.h"
#import "StoreEntity.h"
#import "WarehouseEntity.h"
#import "FrmTableViewController.h"


@interface StViewController ()
{
    UIRefreshControl *refreshControl;
    NSMutableArray *dataset;
}

@end

@implementation StViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Right Bar button setup ==============
    UIBarButtonItem *rbtn = [[UIBarButtonItem alloc] initWithTitle:@"Form" style:UIBarButtonItemStylePlain target:self action:@selector(gotoForm:)];
    self.navigationItem.rightBarButtonItem = rbtn;
   
     //Custom cell registration for tableview ===========
    [_stocksTable registerNib:[UINib nibWithNibName:@"StockCell" bundle:nil] forCellReuseIdentifier:@"StockCell"];
    _stocksTable.tableFooterView = [[UIView alloc] init];
    
    //Refresh functionallity for tableview ============
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    [_stocksTable addSubview:refreshControl];
    _stocksTable.estimatedRowHeight = 68.0;
    _stocksTable.rowHeight = UITableViewAutomaticDimension;
    [self.activityIndicatorView startAnimating];
    [self loadData];
   //messages = [[NSMutableArray alloc] init];
}

- (void) gotoForm:(id)sender{
    FrmTableViewController *formVC = [[FrmTableViewController  alloc] init];
    formVC.hidesBottomBarWhenPushed = true;
    [self.navigationController pushViewController:formVC animated:true];

}
//Get Data from the Datasource ==================
- (void) loadData {
    
    [DataSource getStocks:^(NSArray *stocks){
        
        [DataSource getAllProducts:^(NSDictionary *products){
            
            [DataSource getAllStores:^(NSDictionary *stores){
                
                [DataSource getAllWarehouses:^(NSArray *warehouses){
                   
                    
                    dataset = [NSMutableArray array];
                    for(StockEntity *se in stocks)
                    {
                        FullStock *fs = [[FullStock alloc] init];
                        NSString *idstr = [NSString stringWithFormat:@"%d", se.productId];
                        ProductEntity *pr = [products objectForKey:idstr];
                        fs.productnumber = pr.productNumber;
                        fs.productdescription = pr.productDescription;
                        fs.quantity = se.quantity;
                        if (se.locationType == 1)
                        {
                          WarehouseEntity *wr = [warehouses objectAtIndex:se.locationId];
                            fs.locationname = wr.name;
                        }
                        else if (se.locationType == 2)
                        {
                             NSString *idst = [NSString stringWithFormat:@"%d", se.locationId];
                             StoreEntity *str = [stores objectForKey:idst];
                            fs.locationname = str.name;
                        }
                        
                        [dataset addObject:fs];
                        
                    
                    }
                
                    
                    [refreshControl endRefreshing];
                    [self.activityIndicatorView stopAnimating];
                    
                    [_stocksTable reloadData];
                    
                    
                }];
                
                
            }];
        }];
        
        
        
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataset count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    StockCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StockCell" forIndexPath:indexPath];
    FullStock  *fs = [dataset objectAtIndex:indexPath.row];
    [cell setDetailwithStock:fs];
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
