//
//  TestDataCreator.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "TestDataCreator.h"
#import "ScreensContainer.h"
#import "Screen.h"
#import "Playlist.h"
#import "PlaylistItem.h"

@implementation TestDataCreator

+(ScreensContainer*) createTestScreensContainer {
    ScreensContainer* scr = [[ScreensContainer alloc] init];
	
	NSArray* screenNames = [NSArray arrayWithObjects:@"Screen1", @"Screen2", @"Screen3", @"Screen4", nil];
	NSString* screenDescription = @"The description of the screen";
	
	for (NSString* screenName in screenNames) {
        NSMutableArray* initialPlaylistItems = [TestDataCreator getInitialPlaylistItems];
        Playlist* playlist = [[Playlist alloc] init];
        for (PlaylistItem* item in initialPlaylistItems) {
            [playlist addPlaylistItem:item];
        }
		NSString* link = [NSString stringWithFormat:@"http://www.%@.tv/bar", screenName];
		Screen* screen = [TestDataCreator createScreenWithName:screenName
												   description:screenDescription
														  link:link
														 image:[UIImage imageNamed:@"screen"]
													  playlist:playlist];
		[scr addScreen:screen];
	}
    return scr;
}

+(Screen*) createScreenWithName:(NSString*) name
					description:(NSString*) description
						   link:(NSString*) link
						  image:(UIImage*) image
					   playlist:(Playlist*) playList {


	Screen* screen = [[Screen alloc] init];
	screen.name = name;
	screen.description = description;
	screen.link = link;
	screen.image = image;
	screen.playlist = playList;
	return screen;
}

+(PlaylistItem*) createPlaylistItemWithName:(NSString*) name
									   link:(NSString*) link
								   duration:(NSUInteger) duration
									  image:(UIImage*) image {
	PlaylistItem* playlistItem = [[PlaylistItem alloc] init];
	playlistItem.name = name;
	playlistItem.link = link;
	playlistItem.duration = duration;
	playlistItem.image = image;
	return playlistItem;
}

+(NSMutableArray*) getInitialPlaylistItems {
	UIImage* image = [UIImage imageNamed:@"screen"];
	NSMutableArray* playlistItems = [[NSMutableArray alloc] init];
	PlaylistItem* playlistItem = [TestDataCreator createPlaylistItemWithName:@"ESPN NFL"
																		link:@"www.espn.com/nfl/"
																	duration:30
																	   image:image];
	[playlistItems addObject:playlistItem];
	playlistItem = [TestDataCreator createPlaylistItemWithName:@"USAToday"
														  link:@"www.usatoday.com/sports/"
													  duration:45
														 image:image];
	[playlistItems addObject:playlistItem];
	playlistItem = [TestDataCreator createPlaylistItemWithName:@"FOX Sports"
														  link:@"www.sports.fox.com/main/"
													  duration:30
														 image:image];
	[playlistItems addObject:playlistItem];
	playlistItem = [TestDataCreator createPlaylistItemWithName:@"Official NFL Site"
														  link:@"www.nfl.com/"
													  duration:20
														 image:image];
	[playlistItems addObject:playlistItem];
	return playlistItems;
}

@end
