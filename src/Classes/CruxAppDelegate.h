//
//  CruxAppDelegate.h
//  Crux
//
//  Created by Rusty Larner on 8/9/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CruxViewController;

@interface CruxAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet CruxViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) CruxViewController *viewController;

@end

