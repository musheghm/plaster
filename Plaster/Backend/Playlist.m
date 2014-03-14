//
//  Playlist.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "Playlist.h"

@interface Playlist ()

@property (nonatomic, strong) NSMutableArray* playlistItems;

@end

@implementation Playlist

#pragma mark - Special methods

-(id) init {
    self = [super init];
    if(self) {
        _playlistItems = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Public API

-(void) addPlaylistItem:(PlaylistItem*) item {
    if(nil != item) {
        [_playlistItems addObject:item];
        [self informPlaylistUpdate];
    }
}

-(void) addPlaylistItems:(NSArray*) items {
	for (PlaylistItem* item in items) {
		[self addPlaylistItem:item];
	}
}

-(void) removePlaylistItem:(PlaylistItem*) item {
    NSInteger sz = _playlistItems.count;
    [_playlistItems removeObject:item];
    NSInteger szAfterRemove = _playlistItems.count;
    if(sz != szAfterRemove) {
        [self informPlaylistUpdate];
    }
}

-(NSMutableArray*) playlistItems {
    return _playlistItems;
}

#pragma mark - Private API

-(void) informPlaylistUpdate {
    if([_delegate respondsToSelector:@selector(playlistUpdated:)]) {
        [_delegate playlistUpdated:self];
    }
}

@end
