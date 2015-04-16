//
//  FrmTableViewController.m
//  iosTest
//
//  Created by Aldo Leon on 4/15/15.
//  Copyright (c) 2015 Aldo Leon. All rights reserved.
//

#import "FrmTableViewController.h"
#import "TextCell.h"
#import "SwitchCell.h"
#import "DateCell.h"

@interface FrmTableViewController ()

@end

@implementation FrmTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Form";
    self.navigationItem.hidesBackButton=YES;
    //Submit Bar button setup ==================
    UIBarButtonItem *rbtn = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonSystemItemSave target:self action:@selector(submitForm:)];
    self.navigationItem.rightBarButtonItem = rbtn;
    //Custom Cells registration ===================
    [self.tableView registerNib:[UINib nibWithNibName:@"TextCell" bundle:nil] forCellReuseIdentifier:@"TextCell"];
     [self.tableView registerNib:[UINib nibWithNibName:@"SwitchCell" bundle:nil] forCellReuseIdentifier:@"SwitchCell"];
     [self.tableView registerNib:[UINib nibWithNibName:@"DateCell" bundle:nil] forCellReuseIdentifier:@"DateCell"];
}

- (void) submitForm:(id)sender{
  
    
    TextCell *tcell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    SwitchCell *scell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    
    DateCell  *dcell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2]];
   
    NSString *alertText = tcell.textValue.text;
    if(scell.SwitchValue.isOn)
    {
       alertText = [alertText stringByAppendingString:@", Active,"];
    }
    else
    {
        alertText = [alertText stringByAppendingString:@", Inactive,"];
    }
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
   
    NSString *strDate = @"Date: ";
    alertText = [alertText stringByAppendingString:strDate];
    alertText = [alertText stringByAppendingString:[dateFormatter stringFromDate:dcell.dateValue.date]];
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Saved!"
                          message:alertText
                          delegate:self
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil, nil];
    [alert show];
    
}
#pragma mark - ALERT DELEGATE ===========================
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
     if (buttonIndex == alertView.cancelButtonIndex) {
         [self.navigationController popToRootViewControllerAnimated:TRUE];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    // LOAD TEXTFIELD CELL ===============
    if (indexPath.section == 0)
    {
        TextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextCell" forIndexPath:indexPath];
        return cell;
    }
    // LOAD TEXTFIELD CELL ===============
    else if(indexPath.section == 1)
    {
        SwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwitchCell" forIndexPath:indexPath];
         return cell;
    }
    // LOAD TEXTFIELD CELL ===============
    else
    {
        DateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DateCell" forIndexPath:indexPath];
        return cell;
    }

   
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
