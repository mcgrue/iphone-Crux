//
//  CruxAppDelegate.m
//  Crux
//
//  Created by Rusty Larner on 8/9/08.
//  Copyright __MyCompanyName__ 2008. All rights reserved.
//

#import "CruxViewController.h"
#import "2dScene.h"

@implementation CruxViewController


// Implement loadView if you want to create a view hierarchy programmatically
- (void)loadView {
	TwoD_Scene *my2dScene = [[TwoD_Scene alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[self setView:my2dScene];
}


/*
 Implement viewDidLoad if you need to do additional setup after loading the view.
- (void)viewDidLoad {
	[super viewDidLoad];
}
 */


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [[event allTouches] anyObject];
     
    CGPoint currentLoc = [touch locationInView :_view];
    CGPoint previousLoc = [touch previousLocationInView :_view];

    float changeX = currentLoc.x - previousLoc.x;
    float changeY = currentLoc.y - previousLoc.y;
    
    NSString* myString = [[NSString alloc] initWithString: [NSString stringWithFormat:@"change: (%2.2f,%2.2f)", changeX, changeY]];
    
    [(TwoD_Scene*)_view PersistentMessage: 10 : 100 :myString];    
    [(TwoD_Scene*)_view MoveViewport :changeX :changeY ];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    UITouch *touch = [[event allTouches] anyObject];
    CGPoint currentLoc = [touch locationInView :_view];
    
    if( ![touch tapCount] ) return; // tapCount of 0 indicates a swipe, not a click.  CONTINUE ON!
    
    IMCoord coord = [(TwoD_Scene*)_view GetIMapCoordFromScreenCoords:currentLoc.x :currentLoc.y];    
    
    NSString* myString = [[NSString alloc] initWithString: [NSString stringWithFormat:@"touch: tapcount %d tile (%d,%d)", [touch tapCount], coord.x, coord.y]];
    
    [(TwoD_Scene*)_view PersistentMessage: 10 : 100 :myString];    
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {}
/*

*/

                
- (void)dealloc {
	[super dealloc];
}

@end
