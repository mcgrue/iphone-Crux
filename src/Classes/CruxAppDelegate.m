//
//  CruxAppDelegate.m
//  Crux
//
//  Created by Rusty Larner on 8/9/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "CruxAppDelegate.h"
#import "CruxViewController.h"

@implementation CruxAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	
	// Override point for customization after app launch	
    [window addSubview:viewController.view];
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
	[window release];
	[super dealloc];
}


@end
