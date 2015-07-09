//
//  MasterViewController.h
//  LaunchFromBrowser_ObjC
//
//  Created by Shafi on 09/07/15.
//  Copyright (c) 2015 Shaffiulla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterViewController : UITableViewController

	// String to be displayed on Detail Screen
@property (nonatomic, strong) NSString *detailScreenText;
@property (nonatomic, readwrite) NSInteger numberOfRow;
@property (nonatomic, readwrite) BOOL isFromBrowser;

-(void)refreshTableView;
@end

