//
//  ScreenViewController.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "DataManager.h"
#import "ScreenViewController.h"
#import "PlaylistItemViewController.h"
#import "PlaylistItemCell.h"
#import "MediaItemHeaderView.h"
#import "DescriptionView.h"
#import "Playlist.h"
#import "PlaylistItem.h"
#import "Screen.h"

@interface ScreenViewController () {
	PlaylistItem* _selectedPlayListItem;
}

@property (strong, nonatomic) IBOutlet MediaItemHeaderView *mediaItemHeaderView;
@property (strong, nonatomic) IBOutlet DescriptionView *descriptionView;
@property (strong, nonatomic) IBOutlet UITableView *playListTbView;

@end

@implementation ScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	_playListTbView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
	_playListTbView.editing = YES;
}

-(void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self updateUI];
}

-(void) viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self saveChanges];
}

#pragma mark - Private API

-(void) updateUI {
	if (nil == _screen) {
		self.title = @"Create Screen";
		UIImage* image = [UIImage imageNamed:@"screen"];
		[_mediaItemHeaderView.imageView setImage:image];
	} else {
		self.title = _screen.name;
		[_mediaItemHeaderView.imageView setImage:_screen.image];
		[_mediaItemHeaderView.tfTitle setText:_screen.name];
		[_mediaItemHeaderView.tfLink setText:_screen.link];
		[_descriptionView.tvDescription setText:_screen.description];
	}
	[_playListTbView reloadData];
}

-(void) saveChanges {
    Screen* screen = _screen;
	if (nil == _screen) {
		screen = [[Screen alloc] init];
        DataManager* dm = [DataManager getInstance];
		ScreensContainer* container = dm.screensContainer;
		[container addScreen:screen];
	}
    screen.image = _mediaItemHeaderView.imageView.image;
    screen.name = _mediaItemHeaderView.tfTitle.text;
    screen.link = _mediaItemHeaderView.tfLink.text;
    screen.description = _descriptionView.tvDescription.text;
}

-(void) actionForPickedImage:(UIImage*) image {
	[self hideKeyboard];
	[_screen setImage:image];
}

-(IBAction) addNewPlaylistItem:(id)sender {
	[self hideKeyboard];
    _selectedPlayListItem = nil;
	[self performSegueWithIdentifier:@"PlaylistItemSegue" sender:nil];
}

#pragma mark - UITableView Data Source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSInteger count = [[_screen.playlist playlistItems] count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"PlaylistItemCell";
	
    PlaylistItemCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
	
	NSArray* playlistItems = [_screen.playlist playlistItems];
	PlaylistItem* playlistItem = [playlistItems objectAtIndex:indexPath.row];
	[cell updateWithPlaylistItem:playlistItem];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	if (fromIndexPath.row != toIndexPath.row) {
		NSMutableArray* playlistArray = [_screen.playlist playlistItems];
		PlaylistItem* item = [playlistArray objectAtIndex:fromIndexPath.row];
		[playlistArray removeObject:item];
		[playlistArray insertObject:item atIndex:toIndexPath.row];
	}
}

#pragma mark - UITableView Delegate method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSArray* playlistItems = [_screen.playlist playlistItems];
	_selectedPlayListItem = [playlistItems objectAtIndex:indexPath.row];
	[self performSegueWithIdentifier:@"PlaylistItemSegue" sender:nil];
}

-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}

#pragma mark - Passing screen information to ScreenViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"PlaylistItemSegue"]) {
		PlaylistItemViewController* controller = segue.destinationViewController;
		controller.playlistItem = _selectedPlayListItem;
        controller.screen = _screen;
	}
}

@end
