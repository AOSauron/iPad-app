//
//  StudentTableViewController.m
//  testios-le-2
//
//  Created by Guillaume Garcia on 28/09/2017.
//  Copyright © 2017 Telecom Nancy. All rights reserved.
//

#import "StudentTableViewController.h"
#import "EditViewController.h"

@interface StudentTableViewController ()
@property NSMutableArray *students;
@end

@implementation StudentTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (![self students]) {
        [self setStudents:[[NSMutableArray alloc] init]];
        for (int i = 0; i < 10; i++) {
            [[self students] addObject:[NSString stringWithFormat:@"etudiant %d", i+1]];
        }
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self students] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"studentcell" forIndexPath:indexPath];
    
    [[cell textLabel] setText:[[self students] objectAtIndex:[indexPath row]]];
    
    return cell;
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *name = [[sender textLabel] text];
    NSInteger row = [[[self tableView] indexPathForCell:sender] row];
   
    EditViewController *controller = [segue destinationViewController];
    [controller setName:name];
    [controller setRow:row];

}

- (IBAction)unwindFromCancel:(UIStoryboardSegue *)sender
{
    
}

- (IBAction)unwindFromSave:(UIStoryboardSegue *)sender
{
    EditViewController *controller = [sender sourceViewController];
    NSString *name = controller.champName.text;
    NSInteger row = controller.row;

    [[self students] replaceObjectAtIndex:row withObject:name];

    [[self tableView] reloadData];
    
    
}

@end
