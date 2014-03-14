//
//  Screen.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Playlist;

/**
 The model of the screen
 */
@interface Screen : NSObject

@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* description;
@property (nonatomic, strong) NSString* link;
@property (nonatomic, strong) Playlist* playlist;

@end
