//
//  BaseViewController.h
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

-(void) rightBarButtonItem:(UIBarButtonSystemItem) item withSelector:(SEL) selector;
-(void) hideKeyboard;

@end
