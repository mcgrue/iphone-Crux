//
//  2dScene.m
//  Crux
//
//  Created by Benjamin McGraw on 8/9/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "2dScene.h"

@implementation TwoD_Scene


- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		// Initialization code
        
        myMap = [[InternalMap alloc] init];

        _viewport_x = 0;
        _viewport_y = 0;
        
        NSString* myString = [[NSString alloc] initWithUTF8String: "Initializing test.." ];
        [self PersistentMessage: 10 : 100 :myString];
        
        //NSTimer* refreshTimer        
	}
	
	return self;
}

-(void)refreshScreen {
   
    [self setNeedsDisplay];
}

-(void) MoveViewport :(int) _delta_x :(int) _delta_y {
    _viewport_x += _delta_x;
    _viewport_y += _delta_y;
        
    _viewport_x = MAX(0,MIN(_viewport_x,(myMap->_map_tilesize_x*myMap->_map_size_x)-320));
    _viewport_y = MAX(0,MIN(_viewport_y,(myMap->_map_tilesize_y*myMap->_map_size_y)-480));
    
    [self refreshScreen];
}

- (void)drawRect:(CGRect)rect {
	// Drawing code
	// Get the graphics context and clear it
    CGContextRef ctx = UIGraphicsGetCurrentContext();
	    
    CGContextClearRect(ctx, rect);

    int rendering_offset_x = -(_viewport_x%myMap->_map_tilesize_x);
    int rendering_offset_y = -(_viewport_y%myMap->_map_tilesize_y);

	for( int y=rendering_offset_y; y<480; y+=myMap->_map_tilesize_y ) {
		for(int x=rendering_offset_x; x<320; x+=myMap->_map_tilesize_x) {		
            IMCoord location;
            location.x = (x+_viewport_x)/myMap->_map_tilesize_x;
            location.y = (y+_viewport_y)/myMap->_map_tilesize_y;
        
			CGContextDrawImage( 
                ctx, 
                CGRectMake(x,y, myMap->_map_tilesize_x,myMap->_map_tilesize_y), 
                [myMap getImageForLocation:location]
            );
		}
	}
	
	//NSString* myString = [[NSString alloc] initWithUTF8String: "Lol lol lol." ];
    
    [self DrawText: _persistent_x :_persistent_y :_persistentMessage];
}


- (void) PersistentMessage: (int) screen_x :(int) screen_y :(NSString*) text {

    if( text != _persistentMessage ) {
        [_persistentMessage dealloc];
    }

    _persistentMessage = text;
    _persistent_x = screen_x;
    _persistent_y = screen_y;
    
    [self refreshScreen];
}


- (void) DrawText: (int) screen_x :(int) screen_y :(NSString*) text {
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	
	CGContextSelectFont(ctx, "Helvetica", 24.0, kCGEncodingMacRoman);
	CGContextSetTextDrawingMode(ctx, kCGTextFill);
	CGContextSetRGBFillColor(ctx, 0.0, 0.0, 0.0, 1.0);
	
	CGAffineTransform xform = 
		CGAffineTransformMake(
			  1.0,  0.0,
			  0.0, -1.0,
			  0.0,  0.0
		);
	CGContextSetTextMatrix(ctx, xform);
	
	CGContextShowTextAtPoint(ctx, screen_x, screen_y, [text UTF8String], [text length]);
}

- (IMCoord) GetIMapCoordFromScreenCoords:(int) screen_x :(int) screen_y {
    IMCoord imCoord;
    imCoord.x = (_viewport_x+screen_x)/myMap->_map_tilesize_x;
    imCoord.y = (_viewport_y+screen_y)/myMap->_map_tilesize_y;
    
    return imCoord;
}

- (void)dealloc {
	[super dealloc];
}


@end
