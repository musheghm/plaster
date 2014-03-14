//
//  MediaItemHeaderView.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "MediaItemHeaderView.h"
#import <QuartzCore/QuartzCore.h>

@implementation MediaItemHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void) awakeFromNib {
	_imageView.layer.cornerRadius = 5;
	_imageView.layer.masksToBounds = YES;
}

@end
