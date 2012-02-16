//
//  2dScene.h
//  Crux
//
//  Created by Benjamin McGraw on 8/9/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InternalMap.h"

@interface TwoD_Scene : UIView {
	NSString* _persistentMessage;
    int _persistent_x;
    int _persistent_y;
    
    int _viewport_x;
    int _viewport_y;
    
    InternalMap* myMap;
}

- (void) MoveViewport :(int) _delta_x :(int) _delta_y;

- (void) DrawText :(int) screen_x :(int) screen_y :(NSString*) text;

- (void) PersistentMessage :(int) screen_x :(int) screen_y :(NSString*) text;

- (IMCoord) GetIMapCoordFromScreenCoords:(int) screen_x :(int) screen_y;


@end
