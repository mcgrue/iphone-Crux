//
//  InternalMap.m
//  Crux
//
//  Created by Benjamin McGraw on 8/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//

#import "InternalMap.h"

@implementation InternalMap


- (id) init {
    _map_tilesize_x = 32;
    _map_tilesize_y = 32;    
    _map_size_x = 50;
    _map_size_y = 50;
    
    /// fake vsp.
    _tile01 = [UIImage imageNamed:@"test_01.png"].CGImage;
    _tile02 = [UIImage imageNamed:@"test_02.png"].CGImage;		
    _tile03 = [UIImage imageNamed:@"test_03.png"].CGImage;
    
    //fake map setup
    for( int y=0; y<_map_size_y; ++y ) {
        for(int x=0; x<_map_size_x; ++x ) {
        
            CGImageRef im;
                
            if( ((x%10)==9) || ((y%10)==9) ) {
                im = _tile03;
            } else if( ((x+y)%2)==1 ) {
                im = _tile02;
            } else {
                im = _tile01;
            }
            
            IMCoord pos;
            pos.x = x;
            pos.y = y;
            
            _map[x][y] = [[GameTile alloc] initWithImage:im AndPosition: pos];
        }
    }
    
    return self;
}

-(CGImageRef) getImageForLocation:(IMCoord) location {
    return _map[location.x][location.y]->sprite;
}

@end

@implementation GameObject
- (id) initWithImage :(CGImageRef) im {
    sprite = im;
    metadata = nil;

    return self;
}


- (id) initWithImage :(CGImageRef) im AndPosition: (IMCoord) pos {
    sprite = im;
    map_position = pos;
    metadata = nil;
    
    return self;
}

- (id) initWithImage :(CGImageRef) im AndPosition: (IMCoord) pos AndMetadata: (NSMutableDictionary*) dict_md {
    sprite = im;
    map_position = pos;
    metadata = [[NSMutableDictionary alloc] initWithDictionary: dict_md];
    
    return self;
}

- (void)dealloc {
    
    [metadata dealloc];
	[super dealloc];
}

@end

@implementation GameTile
@end

@implementation GameThing
@end
