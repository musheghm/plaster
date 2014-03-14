//
//  PlaylistItemCell.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlaylistItem;

@interface PlaylistItemCell : UITableViewCell

-(void) updateWithPlaylistItem:(PlaylistItem*) item;

@end
