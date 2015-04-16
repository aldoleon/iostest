//
//  StockCell.m
//  iosTest
//
//  Created by Aldo Leon on 4/15/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import "StockCell.h"

@implementation StockCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setDetailwithStock:(FullStock*)stock
{
    _lblProductNumber.text = stock.productnumber;
    _lblProductDesc.text = stock.productdescription;
    _lblLocation.text = stock.locationname;
    _lblQty.text = [NSString stringWithFormat:@"%d", stock.quantity];
    
}

@end
