//
//  ScreenCell.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "ScreenCell.h"
#import "Screen.h"
#import <QuartzCore/QuartzCore.h>

@implementation ScreenCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) awakeFromNib {
	_screenImageView.layer.cornerRadius = 5;
	_screenImageView.layer.masksToBounds = YES;
}

-(void) updateWithScreen:(Screen*) screen {
	[_screenImageView setImage:screen.image];
	[_screenNameLabel setText:screen.name];
}

@end
