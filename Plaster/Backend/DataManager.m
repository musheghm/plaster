//
//  DataManager.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "DataManager.h"
#import "TestDataCreator.h"

@implementation DataManager

+(DataManager*) getInstance {
    static DataManager* _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[DataManager alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - Special methods

#pragma mark - Public API

-(void) initializeTestData {
	_screensContainer = [TestDataCreator createTestScreensContainer];
}

-(ScreensContainer*) getScreensContainer {
	return _screensContainer;
}

@end
