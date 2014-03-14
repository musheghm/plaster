//
//  PlaylistItemViewController.m
//  Plaster
//
//  Created by Mushegh on 3/14/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "PlaylistItemViewController.h"
#import "MediaItemHeaderView.h"
#import "UtilityMethods.h"
#import "PlaylistItem.h"
#import "Playlist.h"
#import "Screen.h"

#define HOUR_PER_SECONDS 3600

typedef enum {
	COMPONENT_TYPE_HOUR = 0,
	COMPONENT_TYPE_MINUTE,
	COMPONENT_TYPE_SECOND	
} ComponentType;

@interface PlaylistItemViewController () {
	NSMutableArray* _hours;
	NSMutableArray* _minutes;
	NSMutableArray* _seconds;
	NSInteger _pickerViewSeconds;
	BOOL _isPickerOpened;
}

@property (strong, nonatomic) IBOutlet MediaItemHeaderView *mediaItemHeaderView;
@property (strong, nonatomic) IBOutlet UIView *durationBackground;
@property (strong, nonatomic) IBOutlet UILabel *lblDuration;
@property (strong, nonatomic) IBOutlet UIView *pickerBackground;
@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@end

@implementation PlaylistItemViewController

#pragma mark - Special methods

- (void)viewDidLoad {
    [super viewDidLoad];
	if (nil == _playlistItem) {
		self.title = @"Create Item";
		[self rightBarButtonItem:UIBarButtonSystemItemAdd withSelector:@selector(saveChangesAndCloseView)];
		UIImage* image = [UIImage imageNamed:@"screen"];
		[_mediaItemHeaderView.imageView setImage:image];
	} else {
		self.title = @"Item Info";
		[_mediaItemHeaderView.imageView setImage:_playlistItem.image];
		[_mediaItemHeaderView.tfTitle setText:_playlistItem.name];
		[_mediaItemHeaderView.tfLink setText:_playlistItem.link];
		_pickerViewSeconds = _playlistItem.duration;
		[self setPickerDefaultValues];
	}
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if(nil != _playlistItem) {
        [self saveChanges];
    }
}

#pragma mark - UIPickerView DataSource methods

- (IBAction)actionDuration:(id)sender {
	[_mediaItemHeaderView.tfTitle resignFirstResponder];
	[_mediaItemHeaderView.tfLink resignFirstResponder];
	[self showPickerView:!_isPickerOpened withDuration:0.5];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	NSArray* array = [self arrayForComponent:component];
	NSInteger rowsCount = [array count];
    return rowsCount;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	NSArray* array = [self arrayForComponent:component];
	NSString* value = [array objectAtIndex:row];
    return value;
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
	[self updatedDataPickerView:thePickerView];
}

#pragma mark - Private API

-(void) saveChangesAndCloseView {
    [self saveChanges];
    [self.navigationController popViewControllerAnimated:YES];
}

-(void) saveChanges {
    PlaylistItem* item = _playlistItem;
	if (nil == _playlistItem) {
		item = [[PlaylistItem alloc] init];
        [_screen.playlist addPlaylistItem:item];
	}
    item.image = _mediaItemHeaderView.imageView.image;
    item.name = _mediaItemHeaderView.tfTitle.text;
    item.link = _mediaItemHeaderView.tfLink.text;
    item.duration = _pickerViewSeconds;
}

-(NSArray*) arrayForComponent:(NSInteger) component {
	NSArray* array = nil;
	if (COMPONENT_TYPE_HOUR == component) {
		array = [self hoursArray];
	} else if (COMPONENT_TYPE_MINUTE == component) {
		array = [self minutesArray];
	} else if (COMPONENT_TYPE_SECOND == component) {
		array = [self secondsArray];
	}
	return array;
}

-(void) setPickerDefaultValues {
	NSInteger index = _pickerViewSeconds / HOUR_PER_SECONDS;
	[_picker selectRow:index inComponent:COMPONENT_TYPE_HOUR animated:NO];
	index = (_pickerViewSeconds % HOUR_PER_SECONDS) / 60;
	[_picker selectRow:index inComponent:COMPONENT_TYPE_MINUTE animated:NO];
	index = _pickerViewSeconds % (HOUR_PER_SECONDS * 60);
	[_picker selectRow:index inComponent:COMPONENT_TYPE_SECOND animated:NO];
	[self updateDurationLabel];
}

-(void) updatedDataPickerView:(UIPickerView *)thePickerView {
	NSInteger hour = [thePickerView selectedRowInComponent:COMPONENT_TYPE_HOUR];
	NSInteger minue = [thePickerView selectedRowInComponent:COMPONENT_TYPE_MINUTE];
	NSInteger second = [thePickerView selectedRowInComponent:COMPONENT_TYPE_SECOND];
	_pickerViewSeconds = hour * HOUR_PER_SECONDS;
	_pickerViewSeconds += minue * 60;
	_pickerViewSeconds += second;
	[self updateDurationLabel];
	self.navigationItem.rightBarButtonItem.enabled = YES;
}

-(void) showPickerView:(BOOL) shouldShow withDuration:(NSTimeInterval) duration {
	if (shouldShow != _isPickerOpened) {
		CGRect fm = _pickerBackground.frame;
		CGFloat pickerHeight = fm.size.height;
		CGFloat viewHeight = self.view.bounds.size.height;
		fm.origin.y = (shouldShow) ? viewHeight - pickerHeight : viewHeight;
		[UIView animateWithDuration:0.5 animations:^{
			[_pickerBackground setFrame:fm];
		} completion:^(BOOL finished) {
			_isPickerOpened = shouldShow;
		}];
	}
}

-(void) updateDurationLabel {
	NSString* durationString = [UtilityMethods stringFromSeconds:_pickerViewSeconds];
	[_lblDuration setText:durationString];
}

#pragma mark - Lasy instantiation

-(NSArray*) hoursArray {
	if (nil == _hours) {
		_hours = [UtilityMethods arrayWithMinValue:0 maxValue:24];
	}
	return _hours;
}

-(NSArray*) minutesArray {
	if (nil == _minutes) {
		_minutes = [UtilityMethods arrayWithMinValue:0 maxValue:59];
	}
	return _minutes;
}

-(NSArray*) secondsArray {
	if (nil == _seconds) {
		_seconds = [UtilityMethods arrayWithMinValue:0 maxValue:59];
	}
	return _seconds;
}


@end
