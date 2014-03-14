//
//  Playlist.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Playlist;
@class PlaylistItem;

/**
 Delegation of this playlist
 */
@protocol PlaylistDelegate <NSObject>

-(void) playlistUpdated:(Playlist*) playlist;

@end

/**
 The model of the playlist, enabled playlist items add/remove capability as well 
 as signaling on data update.
 */
@interface Playlist : NSObject

/// Delegate of this playlist
@property (nonatomic, assign) id delegate;

/// Adds a new entry to the playlist
-(void) addPlaylistItem:(PlaylistItem*) item;

/// Adds entries to the playlist
-(void) addPlaylistItems:(NSArray*) items;

/// Removes and entry from this playlist
-(void) removePlaylistItem:(PlaylistItem*) item;

/// Returns all the available playlist items
-(NSMutableArray*) playlistItems;

@end
