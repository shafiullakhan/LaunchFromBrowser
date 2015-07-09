//
//  MasterViewController.swift
//  LaunchFromBrowser_Swift
//
//  Created by Shafi on 09/07/15.
//  Copyright (c) 2015 Shaffiulla. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

	// String to be displayed on Detail Screen
	var detailScreenText:String = "" ;
	var numberOfRow:Int = 5;
	var isFromBrowser:Bool = false;
	
	override func awakeFromNib() {
		super.awakeFromNib()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Segues

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier == "showDetail" {
			if let indexPath = self.tableView.indexPathForSelectedRow() {
				self.detailScreenText = (!self.isFromBrowser) ? "Normal Navigation from Master To Detail Page for Row :\(indexPath.row + 1)" : self.detailScreenText;
			}
			
			(segue.destinationViewController as! DetailViewController).detailItem = self.detailScreenText
		}
	}

	func refreshTableView(){
		self.tableView.reloadData()
	}
	
	// MARK: - Table View

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return numberOfRow
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

		let cellTitle = "Row : \(indexPath.row + 1)";
		cell.textLabel!.text = cellTitle
		return cell
	}
}

