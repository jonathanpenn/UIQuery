//
//  CMNMasterViewController.m
//  UIQueryTest
//
//  Created by Jonathan Penn on 7/12/12.
//  Copyright (c) 2012 Navel Labs. All rights reserved.
//

#import "CMNMasterViewController.h"

#import "CMNDetailViewController.h"

@implementation CMNMasterViewController


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Table View

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *name = [self.tableView cellForRowAtIndexPath:indexPath].textLabel.text;
        [[segue destinationViewController] setDetailItem:name];
    }
}

@end
