//
//  ScreensContainer.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Screen;
@class ScreensContainer;

/* 
 Delegation of this container
 */
@protocol ScreensContainerDelegate

/// Fired when the container is updated
-(void) screensContainerUpdated:(ScreensContainer*) screensContainer;

@end

/**
 The container of all the available screens in the system
 */
@interface ScreensContainer : NSObject

/// The delegate of this container
@property (nonatomic, assign) id delegate;

/// Adds a screen to this container
-(void) addScreen:(Screen*) screen;

/// Create new screen
-(Screen*) createScreen;

/// Removes the given screen from this container
-(void) removeScreen:(Screen*) screen;

/// Returns all available screens
-(NSArray*) screens;



@end
