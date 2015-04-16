//
//  HobbieDetailViewController.h
//  iosTest
//
//  Created by Aldo Leon on 4/14/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HobbieDetailViewController : UIViewController<UINavigationControllerDelegate>
- (id)initWith:(NSInteger *)hobbieId_;
@property (strong, nonatomic) IBOutlet UIImageView *imgv;
@property (strong, nonatomic) IBOutlet UILabel *lbl;

@end
