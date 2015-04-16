//
//  StockCell.h
//  iosTest
//
//  Created by Aldo Leon on 4/15/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullStock.h"

@interface StockCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *lblProductNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblProductDesc;
@property (strong, nonatomic) IBOutlet UILabel *lblLocation;
@property (strong, nonatomic) IBOutlet UILabel *lblQty;

- (void)setDetailwithStock:(FullStock*)stock;

@end
