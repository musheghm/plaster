//
//  PlaylistItemViewController.h
//  Plaster
//
//  Created by Mushegh on 3/14/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "BaseViewController.h"

#import <UIKit/UIKit.h>

@class PlaylistItem;
@class Screen;

@interface PlaylistItemViewController : BaseViewController

@property (nonatomic, strong) PlaylistItem* playlistItem;
@property (nonatomic, strong) Screen* screen;

@end
