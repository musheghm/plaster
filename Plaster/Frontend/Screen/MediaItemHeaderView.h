//
//  MediaItemHeaderView.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaItemHeaderView : UIView

@property (nonatomic, strong) IBOutlet UIImageView* imageView;
@property (nonatomic, strong) IBOutlet UITextField* tfTitle;
@property (nonatomic, strong) IBOutlet UITextField* tfLink;

@end
