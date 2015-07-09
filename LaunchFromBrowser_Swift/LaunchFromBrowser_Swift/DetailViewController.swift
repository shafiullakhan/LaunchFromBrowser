//
//  DetailViewController.swift
//  LaunchFromBrowser_Swift
//
//  Created by Shafi on 09/07/15.
//  Copyright (c) 2015 Shaffiulla. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var detailDescriptionLabel: UILabel!


	var detailItem: AnyObject? {
		didSet {
		    // Update the view.
		    self.configureView()
		}
	}

	func configureView() {
		// Update the user interface for the detail item.
		if let detail: AnyObject = self.detailItem {
		    if let label = self.detailDescriptionLabel {
		        label.text = detail.description
		    }
		}
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.configureView()
	}

	@IBAction func buttonPressed(sender: AnyObject) {
		let otherAppURL = "launch-objective-c-app://?numberOfRow=10&detailScreenText=Navigation From Swift Application&showScreen=detailPage".stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding);
		
		if UIApplication.sharedApplication().canOpenURL(NSURL(string: otherAppURL!)!){
			UIApplication.sharedApplication().openURL(NSURL(string: otherAppURL!)!);
		}
		else{
			var alert = UIAlertController(title: "URL error", message: "No custom URL defined for \(otherAppURL)", preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

