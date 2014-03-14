//
//  ScreensContainer.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "ScreensContainer.h"
#import "Screen.h"

@interface ScreensContainer ()

@property (nonatomic, strong) NSMutableArray* screens;

@end

@implementation ScreensContainer

#pragma mark - Special methods

-(id) init {
    self = [super init];
    if(self) {
        _screens = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Public API

-(void) addScreen:(Screen*) screen {
    if(nil != screen) {
        [_screens addObject:screen];
        [self informContainerUpdate];
    }
}

-(Screen*) createScreen {
	Screen* screen = [[Screen alloc] init];
	return screen;
}

-(void) removeScreen:(Screen*) screen {
    NSUInteger sz = _screens.count;
    [_screens removeObject:screen];
    NSUInteger szAfterRemove = _screens.count;
    if(szAfterRemove != sz) {
        [self informContainerUpdate];
    }
}

-(NSArray*) screens {
    return _screens;
}

#pragma mark - Private API

-(void) informContainerUpdate {
    if([_delegate respondsToSelector:@selector(screensContainerUpdated:)]) {
        [_delegate screensContainerUpdated:self];
    }
}

@end
