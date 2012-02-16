//
//  InternalMap.h
//  Crux
//
//  Created by Benjamin McGraw on 8/10/08.
//  Copyright 2008 __MyCompanyName__. All rights reserved.
//


struct IMCoord {
    int x;
    int y;
};

typedef struct IMCoord IMCoord;


@interface GameObject : NSObject
{
    @public
        IMCoord map_position;
        NSMutableDictionary* metadata;
        CGImageRef sprite;
}
- (id) initWithImage :(CGImageRef) im AndPosition: (IMCoord) pos AndMetadata: (NSMutableDictionary*) dict_md ;
- (id) initWithImage :(CGImageRef) im AndPosition: (IMCoord) pos;
- (id) initWithImage :(CGImageRef) im;
@end

@interface GameTile : GameObject
{
}
@end

@interface GameThing : GameObject
{
}
@end


@interface InternalMap : NSObject {
    
    @private
        GameTile* _map[50][50];
    
    @public     
        CGImageRef _tile01;
        CGImageRef _tile02;
        CGImageRef _tile03;
            
        int _map_tilesize_x;
        int _map_tilesize_y;    
        int _map_size_x;
        int _map_size_y;    
}

-(CGImageRef) getImageForLocation:(IMCoord) location;
@end


