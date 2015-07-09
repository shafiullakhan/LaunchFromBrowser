//
//  AppDelegate.swift
//  LaunchFromBrowser_Swift
//
//  Created by Shafi on 09/07/15.
//  Copyright (c) 2015 Shaffiulla. All rights reserved.
//

import UIKit

let kTableCountKey			= "numberOfRow"
let kDetailScreenTextKey	= "detailScreenText"
let kDisplayScreen			= "showScreen"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		// Override point for customization after application launch.
		return true
	}

	func applicationWillResignActive(application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}

	
	// MARK : Handler while launching app from safari
	func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
		// Get reference to master detail page
		let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
		let masterViewController: MasterViewController = storyboard.instantiateViewControllerWithIdentifier("MasterViewController") as! MasterViewController;
		
		// Set values to navigate detail screen
		let queryDictionary = self.parseUrlSchemeQuery((url.query as String?)!);
		masterViewController.detailScreenText = queryDictionary[kDetailScreenTextKey] as! String;
		masterViewController.numberOfRow = (queryDictionary[kTableCountKey] as! NSString).integerValue
		masterViewController.isFromBrowser = true;
		
		// Update Master tablelist
		masterViewController.refreshTableView();
		if (queryDictionary[kDisplayScreen] as! NSString) == "detailPage"{
			// navigate to detail page
			masterViewController.performSegueWithIdentifier("showDetail", sender: nil);
		}
		return true;
	}

	func parseUrlSchemeQuery(queryString : String) -> NSDictionary{
		// Query Dictionary
		var queryStringDictionary :Dictionary <String, String> = [:];
		
		// Array of Components
		let urlComponents = queryString.componentsSeparatedByString("&") as NSArray;
		
		for object in urlComponents{
			// get array of key and value
			let pairComponent = object.componentsSeparatedByString("=") as NSArray;
			
			let key = pairComponent.firstObject as! String ;
			let value = pairComponent.lastObject  as! String;
			
			queryStringDictionary[key.stringByRemovingPercentEncoding!] = value.stringByRemovingPercentEncoding;
		}
		
		return queryStringDictionary;
	}
}

