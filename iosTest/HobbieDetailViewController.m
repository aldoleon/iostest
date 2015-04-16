//
//  HobbieDetailViewController.m
//  iosTest
//
//  Created by Aldo Leon on 4/14/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import "HobbieDetailViewController.h"
#import "HobbieEntity.h"

@interface HobbieDetailViewController ()
{
    NSInteger *hobbieId;
  
}

@end

@implementation HobbieDetailViewController

- (id)initWith:(NSInteger *)hobbieId_ {
    self = [super init];
    
    hobbieId = hobbieId_;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
   

    
}
//Hobbies Static Data setup =========================
- (void) loadData
{
    NSMutableArray *hobbies = [NSMutableArray array];
    
    
    HobbieEntity *hobbie1 = [[HobbieEntity alloc] init];
    hobbie1.id = 0;
    hobbie1.name = @"Surfing";
    hobbie1.img = @"surf.jpeg";
    [hobbies addObject:hobbie1];
    HobbieEntity *hobbie2 = [[HobbieEntity alloc] init];
    hobbie2.id = 1;
    hobbie2.name = @"Cycling";
    hobbie2.img = @"cycling.jpg";
    [hobbies addObject:hobbie2];
    
    
    HobbieEntity *hobbie = [hobbies objectAtIndex:hobbieId];
    _lbl.text = hobbie.name;
    [_imgv setImage:[UIImage imageNamed:hobbie.img]];
    self.navigationItem.title = hobbie.name;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
