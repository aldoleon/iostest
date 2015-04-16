//
//  FullStock.h
//  iosTest
// 
//  Created by Aldo Leon on 4/15/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FullStock : NSObject
    @property (nonatomic, retain) NSString *productnumber;
    @property (nonatomic, retain) NSString *productdescription;
    @property (nonatomic, retain) NSString *locationname;
    @property(nonatomic) int quantity;
@end
