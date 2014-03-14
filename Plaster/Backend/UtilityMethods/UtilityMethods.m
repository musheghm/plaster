//
//  UtilityMethods.m
//  Plaster
//
//  Created by Mushegh on 3/14/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "UtilityMethods.h"

@implementation UtilityMethods

+(NSMutableArray*) arrayWithMinValue:(int) minValue maxValue:(int) maxValue {
	NSMutableArray* array = [[NSMutableArray alloc] init];
	for (int i = minValue; i <= maxValue; ++i) {
		NSString* str = [NSString stringWithFormat:@"%d", i];
		[array addObject:str];
	}
	return array;
}

+(NSString*) stringFromSeconds:(NSUInteger) seconds {
	NSUInteger tmpSeconds = seconds;
	
	NSUInteger hour = tmpSeconds / (60*60);
	tmpSeconds -= (hour * 60*60);
	
	NSUInteger minue = tmpSeconds / 60;
	tmpSeconds -= minue * 60;
	NSString* str = nil;
	NSUInteger second = tmpSeconds;
	if (hour > 9) {
		str = [NSString stringWithFormat:@"%.2ld:%.2ld:%.2ld", hour, minue, second];
	} else {
		str = [NSString stringWithFormat:@"%ld:%.2ld:%.2ld", hour, minue, second];
	}
	return str;
}

@end
