	//
	//  DetailViewController.m
	//  LaunchFromBrowser_ObjC
	//
	//  Created by Shafi on 09/07/15.
	//  Copyright (c) 2015 Shaffiulla. All rights reserved.
	//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
	if (_detailItem != newDetailItem) {
		_detailItem = newDetailItem;
		
			// Update the view.
		[self configureView];
	}
}

- (void)configureView {
		// Update the user interface for the detail item.
	if (self.detailItem) {
		self.detailDescriptionLabel.text = [self.detailItem description];
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];
		// Do any additional setup after loading the view, typically from a nib.
	[self configureView];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
		// Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(UIButton *)button
{
	NSString *otherAppURL = [@"launch-swift-app://?numberOfRow=10&detailScreenText=Navigation From Obj-C Appication&showScreen=detailPage" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
 
	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:otherAppURL]]){
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:otherAppURL]];
	}
	else{
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"URL error"
																	   message:[NSString stringWithFormat:@"No custom URL defined for %@",otherAppURL]
																preferredStyle:UIAlertControllerStyleAlert];
		[alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
		[self presentViewController:alert animated:true completion:nil];
	}
}
@end
