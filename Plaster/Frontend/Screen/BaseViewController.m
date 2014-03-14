//
//  BaseViewController.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self addTapRecognizer];
}

-(void) addTapRecognizer {
	UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
	[self.view addGestureRecognizer:gestureRecognizer];
	gestureRecognizer.cancelsTouchesInView = NO;
}

-(void)hideKeyboard {
	[self.view endEditing:YES];
}

#pragma mark - Public API

-(void) rightBarButtonItem:(UIBarButtonSystemItem) item withSelector:(SEL) selector {
	UIBarButtonItem* barButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:item
																			   target:self
																			   action:selector];
	self.navigationItem.rightBarButtonItem = barButton;
	barButton.enabled = FALSE;
}

- (IBAction)actionPickImage:(id)sender {
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
		UIImagePickerController* picker = [[UIImagePickerController alloc] init];
		[picker setSourceType:UIImagePickerControllerSourceTypeCamera];
		picker.delegate = self;
		[self presentViewController:picker animated:YES completion:nil];
	}
}

#pragma mark - UIImagePicker delegation

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
	if ([mediaType isEqualToString:@"public.image"]) {
		UIImage* img = [info objectForKey:UIImagePickerControllerOriginalImage];
		[picker dismissViewControllerAnimated:NO completion:nil];
		[self actionForPickedImage:img];
	}
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:NO completion:nil];
}

#pragma mark - UITextField Delegate methods

- (BOOL)textFieldShouldClear:(UITextField *)textField {
	[self infoUpdated];	
	return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
	if ([string isEqualToString:@"\n"]) {
		[textField resignFirstResponder];
		return NO;
	} else {
		[self infoUpdated];
		return YES;
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - UITextView Delegate methods

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
	if([text isEqualToString:@"\n"])
		[textView resignFirstResponder];
	[self infoUpdated];
	return YES;
}


#pragma mark - pure virtual methods

-(void) actionForPickedImage:(UIImage*) image {}

-(void) infoUpdated {
	if (!self.navigationItem.rightBarButtonItem.enabled) {
		self.navigationItem.rightBarButtonItem.enabled = TRUE;
	}
}

@end
