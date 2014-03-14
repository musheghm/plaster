//
//  ScreenCell.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Screen;

@interface ScreenCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *screenImageView;
@property (weak, nonatomic) IBOutlet UILabel *screenNameLabel;

-(void) updateWithScreen:(Screen*) screen;

@end
