//
//  Screen.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "Screen.h"
#import "Playlist.h"

@implementation Screen

-(id) init {
    self = [super init];
    _playlist = [[Playlist alloc] init];
    return self;
}

@end
