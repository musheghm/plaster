//
//  DataManager.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "ScreensContainer.h"
#import <Foundation/Foundation.h>

/**
 Central data management.  For now only keeps track on the screens container and creates a test data.
 */
@interface DataManager : NSObject

@property (nonatomic, strong) ScreensContainer* screensContainer;

+(DataManager*) getInstance;
-(void) initializeTestData;

@end
