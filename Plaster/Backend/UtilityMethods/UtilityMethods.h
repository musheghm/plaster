//
//  UtilityMethods.h
//  Plaster
//
//  Created by Mushegh on 3/14/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilityMethods : NSObject

+(NSMutableArray*) arrayWithMinValue:(int) minValue maxValue:(int) maxValue;
+(NSString*) stringFromSeconds:(NSUInteger) seconds;
@end
