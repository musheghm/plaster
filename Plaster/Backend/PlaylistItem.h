//
//  PlaylistItem.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 The model of the item of the playlist
 */
@interface PlaylistItem : NSObject

@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* link;
@property (nonatomic, assign) NSUInteger duration;
@property (nonatomic, strong) UIImage* image;

@end
