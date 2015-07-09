//
//  MasterViewController.m
//  LaunchFromBrowser_ObjC
//
//  Created by Shafi on 09/07/15.
//  Copyright (c) 2015 Shaffiulla. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)awakeFromNib {
	[super awakeFromNib];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.numberOfRow = 5;
	self.isFromBrowser = false;
	
	[self refreshTableView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
		if (!self.isFromBrowser) {
			NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
			self.detailScreenText = [NSString stringWithFormat:@"Normal Navigation from Master To Detail Page for Row :%@",@(indexPath.row + 1)];
		}
	    [[segue destinationViewController] setDetailItem:self.detailScreenText];
	}
}

-(void)refreshTableView{
	[self.tableView reloadData];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.numberOfRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

	NSString *cellTitle = [NSString stringWithFormat:@"Row: %@",@(indexPath.row + 1)];
	cell.textLabel.text = cellTitle;
	return cell;
}

@end
