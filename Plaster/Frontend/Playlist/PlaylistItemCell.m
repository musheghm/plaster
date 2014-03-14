//
//  PlaylistItemCell.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "PlaylistItemCell.h"
#import "PlaylistItem.h"
#import "UtilityMethods.h"

@interface PlaylistItemCell () {
	PlaylistItem* _playlistItem;
}
@property (weak, nonatomic) IBOutlet UILabel *lblDuration;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblLink;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;

@end

@implementation PlaylistItemCell

-(void) awakeFromNib {
	_itemImageView.layer.cornerRadius = 5;
	_itemImageView.layer.masksToBounds = YES;
}

-(void) updateWithPlaylistItem:(PlaylistItem*) item {
	_playlistItem = item;
	NSString* durationString = [UtilityMethods stringFromSeconds:item.duration];
	[_lblDuration setText:durationString];
	[_lblTitle setText:_playlistItem.name];
	[_lblLink setText:_playlistItem.link];
	[_itemImageView setImage:_playlistItem.image];
}

@end
