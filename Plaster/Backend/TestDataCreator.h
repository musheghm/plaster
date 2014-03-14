//
//  TestDataCreator.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "ScreensContainer.h"
#import "Screen.h"
#import "PlaylistItem.h"


#import <Foundation/Foundation.h>

@class ScreensContainer;
@class Screen;
@class PlaylistItem;

@interface TestDataCreator : NSObject

+(ScreensContainer*) createTestScreensContainer;

+(Screen*) createScreenWithName:(NSString*) name
					description:(NSString*) description
						   link:(NSString*) link
						  image:(UIImage*) image
					   playlist:(Playlist*) playList;

+(PlaylistItem*) createPlaylistItemWithName:(NSString*) name
									   link:(NSString*) link
								   duration:(NSUInteger) duration
									  image:(UIImage*) image;


+(NSMutableArray*) getInitialPlaylistItems;
@end
